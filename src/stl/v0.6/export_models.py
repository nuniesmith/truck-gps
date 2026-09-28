"""Export the four v0.6 fit-checkpoint pieces; requires OpenSCAD."""
from pathlib import Path
import subprocess
ROOT=Path(__file__).resolve().parent
for part in ("front_frame", "side_gauge", "plan_gauge", "airpods_charge_test"):
    result=subprocess.run(["openscad", "--export-format", "binstl", "-D", f'part="{part}"',
                           "-o", str(ROOT / f"{part}.stl"), str(ROOT / "fit_check.scad")],
                          capture_output=True, text=True)
    if result.returncode or "WARNING:" in result.stderr or "ERROR:" in result.stderr:
        raise RuntimeError(f"{part}: {result.stderr}")
    print(f"Exported {part}.stl", flush=True)
