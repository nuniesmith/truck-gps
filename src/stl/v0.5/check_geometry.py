"""Reproduce nominal CAD intersection checks, using OpenSCAD binary STL output."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import hashlib
import json
import struct
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "otr620_vnl_v0_5.scad"
CHECKS = ["check_fan_insert", "check_fnk_insert", "check_fan_fnk",
          "check_rear_features", "check_faceplate", "check_shelf", "check_carrier",
          "check_control", "check_airpods", "check_charge", "check_zero",
          "check_module_shelf", "check_module_lids"]


def main():
    with tempfile.TemporaryDirectory(prefix="truck-gps-v5-") as temp:
        def check(name):
            out = Path(temp) / (name + ".stl")
            result = subprocess.run(["openscad", "--export-format", "binstl", "-D",
                                     f'part="{name}"', "-o", str(out), str(SOURCE)],
                                    text=True, capture_output=True)
            empty_message = "Current top level object is empty" in result.stderr
            triangles = None
            if out.exists():
                data = out.read_bytes()
                if len(data) >= 84:
                    triangles = struct.unpack_from("<I", data, 80)[0]
                    assert len(data) == 84 + 50 * triangles, name
            # OpenSCAD can write an 84-byte zero-triangle file for empty contact.
            passed = ((result.returncode == 1 and empty_message and triangles is None)
                      or (result.returncode == 0 and triangles == 0))
            if "ERROR:" in result.stderr or "WARNING:" in result.stderr:
                passed = False
            print(name, "PASS" if passed else "FAIL", flush=True)
            return {"check": name, "passed": passed, "triangles_in_intersection": triangles,
                    "empty_message": empty_message, "exit_code": result.returncode}

        with ThreadPoolExecutor(max_workers=3) as pool:
            results = list(pool.map(check, CHECKS))
    report = {
        "source_sha256": hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
        "scope": "Nominal CAD interference only. Contact-separated checks use 0.01 mm shifts. "
                 "Pico/header, GPS, connector and Zero envelopes are provisional. No physical-fit, "
                 "airflow, structural or printability certification.",
        "checks": results,
    }
    (ROOT / "geometry_checks.json").write_text(json.dumps(report, indent=2) + "\n")
    if not all(row["passed"] for row in results):
        raise SystemExit("At least one CAD intersection is not empty; inspect before printing.")


if __name__ == "__main__":
    main()
