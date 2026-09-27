# v0.5 hardware decisions and electrical plan

Updated 2026-09-27. This is a mechanical prototype and an electrical design plan. There is no completed power-distribution circuit or Pico firmware in this revision. [Print instructions](../src/stl/v0.5/README.md) · [Parts](parts-list.md) · [Software plan](pi-setup.md)

## Selected parts

| Function | Selection | CAD basis / status |
|---|---|---|
| Fan | **Noctua NF-A4x20 5V PWM, four-pin** | 40 × 40 × 20 mm body; **22 mm with pads**; **32 × 32 mm** screw pattern |
| Local controller | **Raspberry Pi Pico 2 WH** | Header-equipped Pico 2 W; mounted using the Freenove board |
| Breakout | **Freenove FNK0081 / CB8101** | **63 × 57 mm**, **58 × 52 mm** mounting pattern from its mechanical drawing |
| Future Linux computer | **Raspberry Pi Zero 2 W** | 65 × 30 mm board; 58 × 23 mm mounting pattern; under the AirPods side of the shelf |
| PopSocket target | **ESR HaloLock Universal Ring 360**, linked ASIN B09BZ17JM7 | Ordered; exact ring and adhesive thickness not measured. CAD recess is a trial |
| Faceplate | Four **M2 × 6 mm** machine screws with plain M2 nuts | Ordered; test actual screw heads and nuts in the supplied coupons |

The final fan choice supersedes both earlier Amazon links: **B071W93333 is the 12 V PWM version; B072Q3CMRW is the three-pin 5 V version.** Neither is the final requested combination. Order by the exact name **NF-A4x20 5V PWM** and verify four pins and 5 V on the label. No unverified replacement ASIN is supplied here.

The other user-supplied links were [Pico 2 WH](https://www.amazon.ca/gp/product/B0FC2QLC17), [Freenove breakout](https://www.amazon.ca/gp/product/B0BFB53Y2N), and [ESR ring](https://www.amazon.ca/dp/B09BZ17JM7). Retail package dimensions are not final part measurements.

## Physical arrangement

- **Inside the cubby:** fan on the driver's-view left, Freenove/Pico assembly on the right. The breakout attaches to a removable rear carrier. Existing dash bolt columns and the shelf's two mounting tongues remain.
- **Under the shelf:** a removable Zero 2 W module on the AirPods side and a separate module for a future selected power board on the PopSocket side. The power module has tie slots and a replaceable blank inlet panel; it does not assume a particular PD/regulator board.
- **Beside the front frame:** an optional control pod with a replaceable blank face for the eventual display and switches. Its outside edge is 42 mm left of the original insert. Verify clearance to truck trim before printing the whole pod.
- **AirPods:** retain the successful collar section and upward-facing 45° orientation, with the v0.4 bottom cable opening. No wireless charger is included.
- **PopSocket:** remove the raised oval rim and use a shallow circular recess for the ESR target. The PopSocket supplies the magnetic attraction. This is storage, with no charging electronics.

The Freenove PCB dimensions are verified, but its assembled height with the Pico, headers and wiring is not. The CAD reserves **21 mm forward from the breakout PCB back face**. Measure that complete stack. Programming USB access is a bench operation with the carrier removed; a plugged-in USB cable has not been shown to fit beside the board inside the cubby.

The future Zero module reserves a board/component envelope, not every header, heatsink or cable variant. Orient and measure connectors before installing it. Neither the Pico nor the Zero includes a GNSS receiver. Live navigation data from the Garmin has not been established; the Linux mapping project may require a separate receiver.

## Airflow and lighting

The proposed fan direction draws from the rear electronics bay and blows forward into a shallow plenum that turns upward. Lower sound slots admit air; the new upper slots exhaust it. The upper slots share the lower grille's capsule shape and pitch but are shorter because the upper frame is thin. Slots around the microphone are omitted.

This is a restricted path: the fan has about **2.4 mm** rear intake clearance; the upper riser narrows to **1.8 mm** in depth. These are CAD clearances, not proof of useful cooling. Bench-test temperature, airflow, whistling and audible GPS instructions. Speaker and fan air share the lower bay, so acoustic isolation is not claimed. If the flow is inadequate, use a larger external vent/plenum or relocate the fan before relying on cooling. The shell is not airtight, and small screw-access openings allow leakage.

Two dim blue LEDs can use the loose printed carrier and the rear carrier's tie slots. Position the LEDs against an internal surface to avoid direct glare; add current limiting and a suitable driver. The carrier's 3.3 mm bores are trial fits for nominal 3 mm LEDs. Secure insulated wires away from the impeller and the microphone path. A separate tie provision can retain a temperature-probe lead; probe shape is not finalized.

## Power architecture

The **Pico makes control decisions**. A separate rated circuit supplies the GPS, fan, LEDs, charging port and future Zero. The Freenove board is a GPIO breakout, not a multi-amp power-distribution device. Do not route accessory load current through GPIO or the Pico's 3.3 V rail.

For initial use, retain the Garmin's supplied/approved power arrangement and give the accessories a separate regulated 5 V supply. Verify the GPS and adapter labels and actual demand; **5 V / 1 A is not a confirmed GPS rating**.

For a later single-input system, select the USB-C sink/PD hardware, converter, protected outputs and connectors together. A plain USB-C socket or splitter is insufficient. USB-C charging outputs need the appropriate source/CC behavior for C-to-C cables. Match the negotiated input, output current, protection and thermal capacity to measured loads. Do not assume all USB-C PD sources offer 12 V.

The future power module's empty space is about **64 × 38 × 15 mm**, reduced by posts and the inlet bosses. Select a circuit that actually fits or replace that module. A protected external power unit remains an option without changing the GPS insert.

A capacitor can help with supply transients; it does not replace a power supply or implement lighting control. A Linux shutdown needs a defined hold-up/power-latch arrangement if ignition or a master switch removes its supply. The Pico can request shutdown and operate a properly rated load switch after an acknowledgment, but power switching hardware is still to be designed. Prevent USB/programming-supply backfeed using the Pico manufacturer's power arrangements.

## Fan wiring and behavior

| Pin | Noctua wire colour | Planned function |
|---|---|---|
| 1 | Black | Common ground |
| 2 | Yellow | Regulated protected 5 V branch |
| 3 | Green | Tachometer input with a suitable 3.3 V interface |
| 4 | Blue | PWM signal through a compatible driver/interface |

Keep fan power continuous during speed control. Nominal maximum fan load is 0.1 A at 5 V. Verify connector orientation; other fan variants have different wire colours.

Use the Pico's hardware PWM at a 25 kHz target. Noctua's white paper recommends a CMOS-style driving circuit and does **not** recommend open-collector PWM drive. Its PWM input has an internal pull-up, which must be checked for compatibility with the Pico's 3.3 V pins and unpowered state. Select and bench-test the interface rather than copying a generic PC-fan diagram. The tach output is a separate open-collector signal, with two pulses per revolution.

With PWM disconnected, the fan normally runs at full speed. That does not cover a controller fault that holds PWM low. Verify boot, reset, disconnected sensor, stalled fan, missing host and driver faults. A software watchdog alone does not establish a hardware fail-safe.

## Sources checked for this revision

- [Noctua NF-A4x20 5V PWM specifications](https://www.noctua.at/en/products/nf-a4x20-5v-pwm/specifications)
- [Noctua three-pin 5 V specifications](https://www.noctua.at/en/products/nf-a4x20-5v/specifications)
- [Noctua PWM specification white paper](https://noctua.at/pub/media/wysiwyg/Noctua_PWM_specifications_white_paper.pdf)
- [Raspberry Pi Pico 2 W datasheet](https://datasheets.raspberrypi.com/picow/pico-2-w-datasheet.pdf)
- [Freenove FNK0081 product](https://store.freenove.com/products/fnk0081) and [CB8101 drawing v1.1](https://github.com/Freenove/Freenove_Breakout_Board_for_Raspberry_Pi_Pico/blob/master/CB8101_mechanical-drawing_v1.1_20240326.pdf)
- [Raspberry Pi Zero 2 W](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/) and [mechanical product brief](https://datasheets.raspberrypi.com/rpizero2/raspberry-pi-zero-2-w-product-brief.pdf)
- [ESR HaloLock Universal Ring 360](https://www.esrtech.com/en-ca/products/halolock-universal-ring-360-black-2-pack)

The layout and clearances are this project's design decisions. They have not been certified by the component manufacturers or physically validated in the truck.
