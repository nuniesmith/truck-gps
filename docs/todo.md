# Build tasks

Updated 2026-09-27. [Current fit tests](../src/stl/v0.6/README.md) · [Parts](parts-list.md) · [Hardware](hardware-v0.5.md) · [Software](pi-setup.md)

## Recorded decisions and completed design work

- [x] Record successful v0.2 front-frame, dash-bolt shank and cased-AirPods collar fits.
- [x] Archive the earlier rear +10 mm correction; superseded by the confirmed 80 mm rear clearance.
- [x] Record 170 mm inside width, 98 mm front height, 80 mm rear height and 64 x 49 x 24 mm cased AirPods.
- [x] Export v0.6 front, side, plan and AirPods charging fit coupons.
- [x] Supply bolt-head sizing coupons; retain **10.8 mm as a trial**, not a confirmed head fit.
- [x] Retain the upward-facing AirPods collar and bottom charging opening; defer wireless charging.
- [x] Record that the ball mount will be removed and the cubby rubber can be removed if it obstructs seating.
- [x] Record ordered M2 × 6 faceplate screws/nuts and the ESR ring.
- [x] Select **Noctua NF-A4x20 5V PWM, four-pin** after clarifying the linked three-pin variant.
- [x] Change architecture to **Pico 2 WH local control**, with **Pi Zero 2 W Linux host later**.
- [x] Add v0.5 fan/plenum, removable Freenove carrier, upper vents, modular controls, ESR trial recess and shelf modules.
- [x] Provide replaceable blank control and inlet panels without inventing dimensions for unselected modules.
- [x] Preserve earlier source revisions and the existing simulation-only Linux package.

CAD and mesh checks are recorded with the v0.5 files. They do not check off the physical tests below.

## Next print batch

- [ ] Print v0.6 `front_frame.stl`, `side_gauge.stl` and `plan_gauge.stl`; record liner state, notch depth and taper fit.
- [ ] Print v0.6 `airpods_charge_test.stl`; compare retention with the previous snug collar.
- [ ] Rework the full shell, fan/plenum, carrier and screw bosses below the confirmed 80 mm rear height.
- [ ] Regenerate the matching shelf/faceplate for the 169.4 mm printed front width; do not mix widths.
- [ ] Recheck all nominal intersections and stepped-cubby containment after integration.
- [ ] Print `bolt_head_fit_test.stl`; record the selected pocket, real head dimensions, bolt length and thread type.
- [ ] Test the v0.6 `airpods_charge_test.stl` with the cased AirPods and actual angled cable; check lid opening and removal.
- [ ] Test ordered M2 hardware with `nut_test.stl` and `bolt_cover_test.stl`; verify thread engagement and tip clearance.
- [ ] After rear-layout revision, print the regenerated `fan_plenum_print_test.stl` to tune bridges and verify support removal before the full insert.
- [ ] Test `fan_mount_test.stl` with the actual four-pin 5 V fan, pads, screws and washers.
- [ ] After rear-layout revision, print the regenerated `rear_carrier.stl`; confirm Freenove hole size/pattern and actual Pico/header/wire height.
- [ ] Test `ring_depth_test.stl`; measure ring diameter and adhesive thickness, then set recess diameter/depth.
- [ ] After rear-layout revision, use a regenerated packing test and `control_outline_test.stl` to check cubby and left-trim space.
- [ ] Check shelf and module clearance above radio controls with the accessories and cables installed.
- [ ] Record filament, nozzle, scale, slicer profile and all measured outcomes before revising parameters.

## When the GPS arrives

- [ ] Measure actual housing thickness, corner radius and bezel boundary.
- [ ] Locate the speaker, microphone, rear mount socket, power button, microSD and USB-C port from the actual unit.
- [ ] Measure the plugged-in 90° cable body and bend envelope; replace the trial keepout in the CAD.
- [ ] Confirm rubber thickness and compression; test housing retention and removal.
- [ ] Verify the faceplate's 1.2 mm overlap bears on housing, never glass; test the gasket and cure material away from the GPS.
- [ ] Confirm GPS/adapter power ratings and peak demand in navigation/charging use. Do not assume 5 V / 1 A.
- [ ] Verify access for resets and servicing without damage to the mount or connectors.

## Before the full print and installation

- [ ] Resolve head size, ring depth, Pico stack and required fastener adjustments; re-export affected parts.
- [ ] Inspect the insert's new fan plenum/vents in the slicer. Review bridges, accessible supports and removal paths; the old v0.2 support guidance no longer applies.
- [ ] Confirm all print footprints including brim, supports, clips and purge lines on the actual 220 mm bed.
- [ ] Select the final material/profile for cab heat and printer capability; evaluate deformation and pad creep.
- [ ] Assemble the carrier, fan, shell, shelf and faceplate with tested hardware; check pinched wires and PCB insulation.
- [ ] Confirm load spreading and rear access for the owned dash bolts; remove the existing ball mount at installation.
- [ ] Test fan flow through the shallow plenum, compartment temperature, speaker intelligibility, whistling and rattles.
- [ ] If flow is inadequate, enlarge/relocate ventilation or fan before relying on cooling.
- [ ] Test magnetic hold and adhesive strength while preserving easy PopSocket retrieval.
- [ ] Verify GPS reception, microphone performance, charging and accessible radio controls while stationary.
- [ ] Evaluate fastener loosening and retention before relying on the assembly on the road.

## Power and controls

- [ ] Initially run Garmin from its supplied/approved supply and accessories from a separate regulated branch.
- [ ] Select exact OLED, switches, temperature probe and LED packages; measure bodies, holes, plugs and service clearance.
- [ ] Cut the replaceable control panel only after those parts are chosen.
- [ ] Select and bench-test the fan PWM interface, tach input and electrical default behavior.
- [ ] Select LED resistors/driver for dim, indirect blue lighting and a manual off command.
- [ ] Build a measured load budget including future Zero, GPS charging, fan, LEDs and AirPods.
- [ ] Select USB-C input/PD hardware, converter, branch protection and proper USB-C charging-source module.
- [ ] Confirm the selected power circuit fits the reserved module, or replace that module/use an external enclosure.
- [ ] Add a suitable inlet cutout to the removable blank; provide edge protection, strain relief and labelled harnesses.
- [ ] Prevent programming/USB supply backfeed; define common grounds and switching default states.
- [ ] Design Linux shutdown/power hold-up before connecting ignition or a true master cutoff.

## Pico firmware and future Linux host

- [ ] Create a Pico 2 WH firmware project after selecting toolchain/version; existing `src/pi/` is not Pico firmware.
- [ ] Implement hardware PWM, bounded sensor acquisition, tach counting, switch debounce and watchdog handling.
- [ ] Port the useful policy behavior: hysteresis, auto/boost, explicit faults and safe fallback requests.
- [ ] Calibrate fan startup/minimum duty and temperatures on real hardware; proposals are not protection ratings.
- [ ] Add OLED/LED behavior after the control loop works; keep display/network failure independent.
- [ ] Test boot/reset, sensor loss, stuck fan, controller faults and host disconnection.
- [ ] Define and test a versioned bounded Pico–Zero protocol and stale-command handling.
- [ ] Fit the future Zero, actual header/ports and microSD access in the shelf module; revise if needed.
- [ ] Install supported Pi OS Lite and network access; test logging and controlled shutdown on the bench.
- [ ] Verify a live GNSS data source, then implement no-fix handling, track storage, distance and year-boundary logic.
- [ ] Add private home-display access and maps; recheck current API terms/pricing before integration.

Older prompts and rationale remain in [chats.md](chats.md). This active task list supersedes earlier controller and fan choices without treating untested models as completed physical work.
