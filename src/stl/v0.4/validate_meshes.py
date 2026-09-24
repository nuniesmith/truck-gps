"""Check exported binary STLs using NumPy; writes the public validation report."""
from pathlib import Path
import collections
import hashlib
import json
import struct

import numpy as np

ROOT = Path(__file__).resolve().parent
DTYPE = np.dtype([("normal", "<f4", (3,)), ("vertices", "<f4", (3, 3)), ("attr", "<u2")])


def read_stl(path):
    data = path.read_bytes()
    count = struct.unpack_from("<I", data, 80)[0]
    assert len(data) == 84 + count * 50, path
    return np.frombuffer(data, dtype=DTYPE, offset=84)["vertices"].astype(float)


checks = []
for path in sorted(ROOT.glob("*.stl")):
    vertices = read_stl(path)
    points, indices = np.unique(vertices.reshape(-1, 3), axis=0, return_inverse=True)
    triangles = indices.reshape(-1, 3)
    edges = collections.Counter()
    winding = collections.Counter()
    parent = list(range(len(points)))

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    for triangle in triangles:
        for i in range(3):
            a, b = int(triangle[i]), int(triangle[(i + 1) % 3])
            key = tuple(sorted((a, b)))
            edges[key] += 1
            winding[key] += 1 if a < b else -1
            parent[find(a)] = find(b)
    cross = np.cross(vertices[:, 1] - vertices[:, 0], vertices[:, 2] - vertices[:, 0])
    area2 = np.linalg.norm(cross, axis=1)
    volume = np.einsum("ij,ij->i", vertices[:, 0], np.cross(vertices[:, 1], vertices[:, 2])).sum() / 6
    extent = np.ptp(points, axis=0)
    components = len({find(i) for i in range(len(points))})
    bad = sum(n != 2 for n in edges.values())
    wrong_winding = sum(n != 0 for n in winding.values())
    degenerate = int(sum(area2 == 0))
    assert bad == wrong_winding == degenerate == 0 and volume > 0, (path, bad, wrong_winding, degenerate, volume)
    assert components == (6 if path.name == "bolt_head_fit_test.stl" else 1), (path, components)
    assert points[:, 2].min() > -0.001 and np.all(extent[:2] + 20 <= 220), (path, extent)
    checks.append({
        "file": path.name, "triangles": len(triangles), "size_mm": extent.round(3).tolist(),
        "min_z_mm": round(float(points[:, 2].min()), 6), "connected_components": components,
        "nonmanifold_edges": bad, "inconsistent_winding_edges": wrong_winding,
        "degenerate_triangles": degenerate, "volume_mm3": round(float(volume), 3),
        "fits_220mm_bed_with_10mm_brim_per_side": True,
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
    })
report = {
    "units": "mm", "checks": checks,
    "scope": "Closed oriented mesh, nonzero triangles, expected component count and nominal bed envelope. Not a slicer, material-strength or physical-fit certification.",
}
(ROOT / "mesh_checks.json").write_text(json.dumps(report, indent=2) + "\n")
print(json.dumps(checks, indent=2))
