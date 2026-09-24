# v0.2 fit results and v0.4 follow-up

[Project](../README.md) · [Master tasks](todo.md) · [Pi setup](pi-setup.md) · [Parts list](parts-list.md)

Updated September 22, 2026 with the user's photos and measured correction. This record concerns the actual v0.2 pieces; it does not establish fit of the newer external tabs, M2 hardware or complete assembly.

## Reported results

| Feature | User report | v0.4 action |
|---|---|---|
| Front frame | Fits well | Preserve 164.5 × 98.0 mm opening envelope and front profile |
| SIDE gauge rear step | Rear needs to come up **10 mm**, confirmed measured | Raise the rear lower roof/step by 10 mm in both gauge and insert; keep depth, floor and front unchanged |
| Front of SIDE gauge | Front is acceptable; rear contact with rubber lip affects seating | No front tilt/height change; remove rubber if necessary before tightening |
| Dash bolt | Shank passes, head pocket needs enlargement | Preserve 7 mm bore; supply labeled 10.6–12.2 mm head coupons and a **provisional 10.8 mm** insert |
| AirPods with Latercase | Snug fit in the v0.2 collar | Preserve nominal 64.2 × 23.8 mm stadium opening and 12 mm collar wall; add a bottom USB-C opening |
| Charging | Wired bottom access selected | Trial 18 × 10 mm opening; verify actual plug and elbow using the small cup |
| Existing ball mount | Will be removed after the new mount is ready | No ball-mount clearance added |
| TOP gauge / PopSocket | No separate measured result supplied | Keep taper and PopSocket geometry provisional |

Print the three small [v0.4 tests](../src/stl/v0.4/README.md) before the large parts. Bolt-head width, cable-body dimensions and reprinted-part fit remain unmeasured.

Earlier software review baseline: commit `e825f1b328b1a2e486c40cde8956fd3944a4d090`. PR #3 is merged. The current Pi files match the reviewed source, and all 21 software tests pass on Linux/Python 3.12.14. That verifies simulation behavior, not Pi installation, electrical operation, fit or road durability.

## Bring to the truck

- All four prints, with the two depth gauges and two accessory test pieces kept identifiable.
- Calipers if available, a ruler, the intended dash bolt/nut/washer hardware, the AirPods with Latercase and the PopSocket.
- The rubber roll or a measured sample, and the intended right-angle USB-C cable if available.
- Phone camera, removable labels and a pen. Take measurements before sanding or adjusting the parts.

Let prints cool, remove support/brim residue that interferes with seating, and record any elephant foot or warping. Do the fit checks while parked. These tests do not require drilling or final assembly.

## The four files

Nominal dimensions below are derived from the committed [v0.2 OpenSCAD source](../src/stl/v0.2/otr620_vnl_insert.scad), not measurements of the printed parts. Print at 100% scale. Measure the print as well as the truck so printer error is not mistaken for a CAD error.

| File / pieces | Nominal geometry | Check and record | What it cannot prove |
|---|---|---|---|
| `fit_test_1_face_frame.stl` | Outer frame 164.5 × 98.0 mm; GPS pocket 153.8 × 87.8 mm; approximately 4 mm deep | Fit at the front opening; corner/lip interference; left/right/top gaps; whether it sits level without force | Full-depth fit, rear features, GPS fit without the actual unit, or v0.3 external tabs |
| `fit_test_2_depth_gauges.stl` — TOP gauge | Plan outline: 164.5 mm front width, 156.5 mm rear width, 50.8 mm depth | Front-to-rear taper and depth; place the FRONT edge at the cubby front reference; record where it stops and the actual width at that depth | Rounded internal corners, local ribs or the full three-dimensional insert |
| Same file — SIDE gauge | Front height 98.0 mm; front-to-back 50.8 mm; upper step at 24.4 mm depth | Floor reference, upper bar, roof and back wall; test near both sides where accessible; record front protrusion and first contact | Side-wall taper or complete cable/electronics clearance |
| `fit_test_3_bolt_trap.stl` | 7.0 mm shank passage, 10.3 mm hex across flats, 12.0 mm bearing-seat-to-back distance | Bolt head seats fully without spinning; shank slides through; measure actual head, shank and usable thread beyond the coupon | M2 faceplate nut/screw fit, actual dash wall thickness or complete shelf joint strength |
| `fit_test_4_shelf_pockets.stl` — AirPods collar | Inner stadium outline 64.2 × 23.8 mm; collar height 12 mm | Slide over the cased AirPods gently; note tight axes, rocking, seam/button interference and removal effort | The v0.3 upward-facing tray footprint, case height, lid opening, charging access or bump retention |
| Same file — PopGrip seat | Default round recess diameter 59.5 mm, depth 3 mm | Record which PopSocket you own and measure its full base length/width/thickness | The oval PopSocket fit or magnetic retention; the old round seat is not an acceptance test for the oval part |

The frame's nominal cubby clearance is 0.30 mm per side and 0.40 mm at the top. A small deliberate gap is expected; the target is easy seating without binding, not a forced interference fit. Confirm the cubby height is measured from the **top of the black front floor lip** to the opening top. Measuring from lower surrounding trim changes the reference and can invalidate the height.

## Record results

| Item | Measured print size | Truck/accessory measurement | Fits / tight / loose / stops short | Photo / notes |
|---|---|---|---|---|
| Face-frame width and height | | | | |
| Front floor lip / opening corners | | | | |
| TOP gauge, front and rear widths | | | | |
| SIDE gauge, depth and upper bar | | | | |
| Dash bolt head, shank and projection | | | | |
| AirPods width, depth and height with Latercase | | | | |
| PopSocket base length, width and thickness | | | | |

Record printer/filament/nozzle/layer height, slicer scale, supports, print orientation and any cleanup. Photograph the frame straight-on, both gauges in place, and any contact point with a ruler in view. Use the driver's view when labelling left/right. If a gauge binds, record how far its FRONT edge remains proud instead of forcing it.

For a loose fit, record the gap on each side separately. For a tight fit, distinguish a local corner or print defect from the whole width/height being wrong. Adjust measured CAD parameters later; do not globally rescale the model because that also changes bolt holes and hardware pockets.

Bolt length must be chosen using the measured dash wall plus the printed bearing stack, washers, nut and required thread engagement. The 12 mm coupon stack is not a recommendation for a 12 mm bolt. The large dash bolts and small M2 faceplate screws are separate fastener systems.

## What the review leaves unresolved

| Priority | Finding | Next action |
|---|---|---|
| Before the full assembly print | Passing v0.2 does not validate the v0.3 faceplate tabs. Those extend the nominal overall width from 164.5 to 176.5 mm. | Check surrounding trim and print the v0.3 tab/nut coupons after cubby measurements are recorded. |
| Before printing the v0.4 insert | The 10.3 mm v0.2 head trap failed; v0.3 is smaller at 9.9 mm. The v0.4 10.8 mm choice is provisional. | Use the labeled v0.4 head coupons; retain the 7 mm bore that passed. Change `head_af` and re-export if a different coupon fits best. |
| Before adding electronics | The current sound-window height is 39.4 mm. The selected fan body is 40 × 40 × 20 mm, or 22 mm thick with pads. | Treat a fan inside that unchanged window as unproven; design a separate carrier/air path and check the whole installation envelope. |
| Before fixing the fan location | Nominal rear duct depth is only 29.8 mm, calculated as 50.8 − 2.0 back wall − 19.0 GPS pocket depth. | Include GPS rear protrusions, USB elbow, mounting hardware, fan connector, bends and airflow space in the layout. Body thickness alone is insufficient. |
| Before adding holes near the shelf joint | The original tongue-channel roof has about 1.3 mm of nominal plastic beneath the GPS pocket: 6.6 − 5.3 mm. This is a geometry observation, not a strength result. | Keep new cable slots/fasteners away from this bridge until the section and load path are reviewed. |
| Before accepting the shelf | v0.2 collar/round-seat tests do not validate the newer tray orientation, oval pocket or the user's retrieval motion. | Check the v0.4 charging cup, oval PopSocket seat and shelf reach (about 82 mm forward and 74 mm below the cubby). |
| When the GPS arrives | Housing thickness, faceplate overlap, rear ports and gasket compression remain assumptions. | Measure the device and plugged-in cable; verify the faceplate bears on housing and clears glass, controls and ports. |
| Before powering physical hardware | The Pi controller is simulation-only. The default curve does not establish fan startup/minimum duty or fault behavior. | Select the GPIO/PWM interface, test live sensor acquisition and calibrate actual fan behavior on the bench. |
| Before combining supplies | GPS demand, AirPods charging demand, wiring losses and Linux power-hold/shutdown are unresolved. | Keep initial Garmin power separate; complete a measured power budget before selecting shared distribution hardware. |

Fan dimensions are recorded with manufacturer references in [the existing fan plan](pi-setup.md#selected-fan-and-proposed-interface). The 39.4 mm and 29.8 mm values are calculated from CAD. They do not establish available installed airflow clearance.

## Useful work before the Pi or GPS arrives

1. **Component measurement list:** record exact part numbers and envelopes for the Pi/header/connectors, fan, OLED, switches, USB panels and angled cables. Keep unresolved selections blank instead of designing permanent holes around guesses.
2. **Bench wiring plan:** define separate power branches, removable connectors, LED driver/resistors, temperature-sensor placement and the fan signal interface. Final regulator/fuse sizing waits for the verified loads and wiring.
3. **Software next step:** implement bounded live 1-Wire acquisition behind an adapter, with tests for missing files, invalid samples and old readings. Keep hardware outputs disabled until the actual board/OS and wiring are verified.
4. **Serviceability plan:** reserve access to the microSD card, screws, GPS power button and cable connectors. An electronics carrier should come out without breaking the GPS support or permanent wiring.
5. **Charging sequence:** verify wired AirPods access first. A removable wireless charger can follow after the actual puck, case alignment and temperature behavior are tested; an exposed shelf alone does not validate temperatures.

The reported +10 mm rear correction is implemented in [v0.4](../src/stl/v0.4/README.md); earlier revisions are preserved. Mesh checks and limited CAD intersection checks pass. Physical fit of the new files, bolt-head selection, cable access and the complete assembly still require the follow-up tests.

