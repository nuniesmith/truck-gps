"""Export the named v0.5 parts with OpenSCAD; no third-party Python packages."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import argparse
import subprocess

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "otr620_vnl_v0_5.scad"
PARTS = {
    name: name for name in (
        "insert_v5", "faceplate_v5", "shelf_v5", "rear_carrier",
        "control_pod", "control_panel", "control_outline_test",
        "zero_tray", "zero_cover", "power_tray", "power_cover",
        "power_inlet_panel", "ring_depth_test", "fan_mount_test",
        "packing_test", "fan_plenum_print_test", "nut_test", "bolt_cover_test", "led_carrier",
    )
}
PARTS.update({"side_gauge_plus10": "side_gauge", "bolt_head_fit_test": "bolt_head_coupon",
              "airpods_charge_test": "airpods_charge_test"})


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, default=2)
    parser.add_argument("--only", choices=PARTS, nargs="+")
    args = parser.parse_args()
    if args.jobs < 1:
        parser.error("--jobs must be positive")

    def export(name):
        command = ["openscad", "--export-format", "binstl", "-D",
                   f'part="{PARTS[name]}"', "-o", str(ROOT / (name + ".stl")), str(SOURCE)]
        result = subprocess.run(command, text=True, capture_output=True)
        if result.returncode:
            raise RuntimeError(f"{name}: {result.stdout}\n{result.stderr}")
        print(f"Exported {name}.stl", flush=True)

    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        list(pool.map(export, args.only or PARTS))


if __name__ == "__main__":
    main()
