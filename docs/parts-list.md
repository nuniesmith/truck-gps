# Parts list and home inventory

Updated September 22, 2026. Covers the v0.4 fit revision, retained V3.1 faceplate hardware and planned Pi Zero 2 W accessories. [Fit worksheet](fit-test-v0.2.md) · [Build tasks](todo.md) · [Pi plan](pi-setup.md) · [Mechanical instructions](../src/stl/v0.4/README.md)

The large dash bolts are **already owned**. Small metric hardware needs checking at home. The rubber roll, AirPods/Latercase and PopSocket were supplied or described earlier; exact dimensions and suitability remain to verify. The GPS was previously not yet available. Other ownership is unconfirmed.

This is a complete planning inventory, not a finalized electronics shopping order. Quantities are for one mount; unresolved parts are explicitly marked. CAD-dependent screw lengths, power ratings and connector choices must be settled before buying those items.

## 1. Small faceplate hardware — check this at home first

| Item | Installed quantity | Specification for the current design | Inventory |
|---|---:|---|---|
| Faceplate machine screws | 4 | **M2 × 6 mm, 0.4 mm pitch**, pan or button head about 4 mm diameter or smaller; length measured from under the head to the tip | Check at home; 6–8 total gives spares |
| Faceplate hex nuts | 4 | **Plain M2, 0.4 mm pitch**, nominal **4.0 mm across flats × 1.6 mm thick** | Check at home; 6–8 total gives spares |
| Matching precision screwdriver/bit | 1 | Must match the screws you actually have; no drive style is mandatory | Check toolkit |
| Removable nut-entry covers | 4 small pieces | Temporary tape over the open loading slots; a positive removable cover remains a possible improvement | Check supplies |

These are machine screws threaded into metal nuts, not self-tapping screws. M2.5, M3, countersunk screws and thicker locking nuts are not direct substitutes. If your available hardware differs, record it before we change the model. No M2 washers or heat-set inserts are specified for this faceplate.

The current source uses 2.2 mm screw-clearance holes, a 4.3 mm across-flats nut pocket and 1.8 mm nut-slot thickness. The nominal 6 mm screw passes through a 2.4 mm faceplate and 2.0 mm bearing wall, leaving about 1.6 mm of reach into the nut. There is very little spare depth behind the tip. **Do not substitute M2 × 8 mm or add washers without checking the stack.**

Print `src/stl/v0.3/nut_fit_test.stl` and `bolt_cover_test.stl`, then test them together with the actual screw/nut pair. The nut coupon provides 4.1/4.3/4.5 mm across-flats choices. Check seating, engagement, tip clearance and repeated removal before the full print. These M2 tests remain pending; the v0.2 truck and accessory tests do not validate them. v0.4 retains the same faceplate hardware.

Dimension references: [M2 plain nut specification](https://www.accu.co.uk/hexagon-nuts/7884-HPN-M2-A2) and [example M2 × 6 pan-head screw specification](https://www.accu.co.uk/torx-pan-head-screws/475309-SHP-M2-6-V2-A2). The screw link illustrates dimensions, not a required brand, drive or seller.

## 2. Mechanical mount and initial GPS installation

| Item | Quantity | Specification / purpose | Status or decision |
|---|---:|---|---|
| Main printed insert | 1 | `src/stl/v0.4/insert_trial_10p8.stl` | Rear step raised 10 mm; select head size with the coupon before the long print |
| Removable printed faceplate | 1 | `src/stl/v0.4/faceplate.stl` | V3.1 geometry retained; GPS overlap/gasket fit still provisional |
| Accessory shelf | 1 | `src/stl/v0.4/shelf_wired_airpods.stl` | Tested AirPods collar section at 45° with bottom cable opening; oval PopSocket seat retained |
| Fit coupons | 1 set per affected revision | Three v0.4 follow-up files plus existing v0.3 tab/nut coupons | Tests are not installed parts |
| Filament | Slicer-estimated amount plus test allowance | Final material/profile must suit the printer and installed temperatures | Existing stock/type to confirm; final material not selected |
| Large dash bolts | 4 | Existing hardware; measure head across flats, shank, pitch and under-head length | **Already owned**; do not buy replacements yet |
| Matching dash nuts | 4 | Correct thread for the owned bolts; locking style subject to rear access | Check whether already owned; do not assume M6 or 1/4-inch interchangeability |
| Rear backing washers or load-spreading plate | 4 washers or 1 designed plate | Match shank, dash bearing area and available space | Verify actual wall thickness and rear access |
| Rubber pad material | 1 small sheet/roll | Existing roll first; current model assumes 1 mm uncompressed pads and 0.7 mm compressed side allowance | **Roll already provided**; measure with adhesive and under compression |
| Pad adhesive | Small amount if needed | Compatible with actual rubber and print; existing adhesive may suffice | Test adhesion; keep pads removable from the GPS |
| Front gasket material | About 0.6 m starting allowance | Small compliant strip fitted to the 1.2 mm-wide × 0.6 mm-deep groove; thickness/compression to test | Alternative: compatible gasket maker cured in the removed faceplate; do not buy both by default |
| Magnetic target for PopSocket | 1 | Current CAD assumes a **steel target ring**, 55 mm OD / 43 mm ID / 1 mm thick | Dimensions are placeholders; test the actual PopSocket against the target first |
| Target-ring adhesive | Small amount | Compatible with metal and selected plastic, or suitable supplied adhesive | Verify retention and cure before assembly |
| Garmin OTR620 | 1 | Actual device for final housing, bezel, port and retention checks | Previously awaiting purchase/arrival; confirm status |
| Garmin supply and cable | 1 set | Initially retain the device's supplied/approved power arrangement | Do not treat 5 V/1 A as a confirmed requirement |
| Right-angle USB-C cable for GPS | 1 if needed | Correct plug direction, charging compatibility and strain-relief envelope | Existing cable(s) described; measure when plugged into GPS |
| Cable ties | 2 initially, plus spares | Fit the provisional 2 × 4 mm strain-relief slots | Trial-fit the ties; clamp cable jacket with connector slack |
| Cable-hole edge protection | 1 per drilled cable opening | Grommet/bushing matched to actual hole, panel thickness and cable bundle | Select after connector routing is fixed |
| Cased AirPods and PopSocket | 1 each | Actual accessories for fit checks | Already described; measure full installed cases/bases |

**Large-bolt fit:** the user reports that the v0.2 **7 mm shank passage fits** but the **10.3 mm head trap is too small**. v0.3 has a smaller 9.9 mm trap. v0.4 preserves the bore and supplies labeled 10.6, 10.8, 11.0, 11.4, 11.8 and 12.2 mm across-flats coupons. Its complete insert uses **10.8 mm as a trial**, not a measured final head size. Choose the smallest coupon that fully seats the actual head without force and still resists rotation; update `head_af` before the long print if needed.

The shelf currently shares the two lower dash bolts through its tongues/L-tabs; there is no separate shelf-bolt purchase for that joint. The steel target uses the PopSocket's existing magnetic attachment; if a separate magnet is preferred, choose and test it first, then revise the recess. This location is for storage only.

## 3. Pi, fan and temperature sensing — later electronics stage

| Item | Quantity | Selected specification / purpose | What remains |
|---|---:|---|---|
| Raspberry Pi Zero 2 W | 1 | Selected Linux host; board nominally 65 × 30 mm | Ownership and exact board variant to confirm |
| GPIO header | 1 if absent | Compatible 40-pin header; standard Zero 2 W has an unpopulated footprint | Skip if the purchased board already has a suitable header |
| microSD card | 1 | OS and application storage; 32 GB is a starting capacity allowance, not a measured logging requirement | Select reliable media and retention policy |
| microSD reader | 1 if needed | Flash OS from computer | Reuse existing reader |
| Pi bench supply | 1 | Raspberry Pi's 12.5 W Micro USB supply is a compatible bench option | Bench supply only; does not specify the truck's full accessory supply |
| Pi power lead/adapter | 1 if not captive | **Micro-USB at the Pi**, chosen upstream connector | Allow connector and bend clearance in CAD |
| Noctua NF-A4x20 **5V PWM** | 1 | Four-pin, 40 × 40 × 20 mm; 22 mm with pads; 32 mm hole spacing; max 0.1 A at 5 V | Selected model; ownership/installed clearance to confirm |
| Fan connector/extension | 1 usable harness | Preserve all four conductors if adding tach feedback | Package includes an extension, splitter and OmniJoin adapters; avoid duplicate purchases |
| Fan mounting hardware | 1 set | Package includes fan screws and four anti-vibration mounts | Final printed carrier may require different hardware; lengths not finalized |
| Removable fan/electronics carrier | 1 assembly | Future electronics revision; not included in the v0.4 fit files | Not designed yet; includes mounting and service access |
| Pi/board standoffs, screws and nuts | 1 set per board | Match actual board holes, clearance and carrier design | **Size, length and count TBD**; faceplate M2 hardware is not a universal electronics kit |
| DS18B20 temperature sensor | 1 initially | GPS-compartment measurement; choose package/probe and record device ID | No physical sensor reading implemented yet |
| Second temperature sensor | 0 initially; 1 optional | Charger-area measurement if added | Not a battery-core temperature reading |
| 1-Wire pull-up resistor | 1 per bus if not already on selected board | 4.7 kΩ starting value, with data pull-up to Pi-compatible 3.3 V | Verify selected module, cabling and bus behavior |
| Sensor harness/connectors | 1 per sensor | Externally powered three-wire connection, labels and strain relief | Wire length and connector series TBD |
| Fan PWM interface | 1 circuit/module | Pi-compatible signal interface for verified 25 kHz PWM | Part selection and powered/unpowered behavior unresolved; no direct-GPIO assumption |
| Optional tach interface | 1 if RPM feedback used | Pi-compatible input/pull-up arrangement | Select and verify before connection |

The fan needs regulated 5 V power from a suitable branch, not a GPIO pin. The present software only simulates outputs. Physical board/OS PWM support, startup behavior and fault defaults still require bench tests.

Sources: [Pi Zero 2 W](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/), [Pi Micro USB supply](https://www.raspberrypi.com/products/micro-usb-power-supply/), [Noctua specifications and package contents](https://www.noctua.at/en/products/nf-a4x20-5v-pwm/specifications), [DS18B20 datasheet](https://www.analog.com/media/en/technical-documentation/data-sheets/DS18B20.pdf).

## 4. Blue lighting, controls and optional display

| Item | Quantity | Specification / purpose | Selection status |
|---|---:|---|---|
| Diffused blue LEDs | 2 initially | Nominal 3 mm bodies; existing carrier holes 3.3 mm | Pick low-current operating point and test night brightness |
| LED current-limiting resistors | 2 | One per LED; value and wattage based on selected LED, supply and target current | Calculate after choosing LEDs; do not assume one shared resistor |
| LED switch/driver circuit | 1 channel | Pi-compatible transistor/MOSFET driver, with required bias/protection components | Exact parts TBD; GPIO supplies control signals |
| Printed LED carrier | 1 | `src/stl/v0.3/led_carrier.stl` | Location, mounting screw and wire clearance provisional |
| LED harness/connector | 1 set | Removable wiring kept clear of sound path | Length/gauge/connector TBD |
| LED on/off input | 1 | Small switch or button with suitable driver/input wiring | Type, hole and electrical function not frozen |
| Fan auto/boost input | 1 | Mode control; software currently supports auto or full-speed boost | Physical input/debounce not implemented |
| Main shutdown/power control | 1 planned | User-facing shutdown request coordinated with power-hold hardware | Do not substitute an abrupt Pi supply cut for this function |
| GPS branch control | 1 optional | Appropriately rated switch or load switch if separate GPS control is retained | Not required for the initial direct Garmin supply |
| OLED module | 1 optional | Select SSD1306 or SH1106, 128 × 64, 0.96 or 1.3 inch; exact driver and 3.3 V logic compatibility to verify | No final module or cutout yet |
| OLED cable and mounting hardware | 1 set | Match selected module and removable faceplate/carrier | Pinout, supply, pull-ups and hardware TBD |

Four front controls remain the planning allowance; buy their exact forms only after the electrical functions and available panel space are agreed. Front controls do not all carry load current.

## 5. Power distribution and AirPods charging

| Item | Quantity | Purpose | Selection status |
|---|---:|---|---|
| Auxiliary regulated supply | 1 | Pi, fan, LEDs and selected peripherals | Choose after combined load, input source and cable loss are known |
| Distribution board or secured terminal assembly | 1 | Separate protected accessory branches and returns | Layout, ratings and connector system TBD |
| Branch protection | 1 provision per powered branch | Fuse/electronic protection sized to load, wiring and source | Ratings and exact count TBD; not a guessed 4 A system |
| Power-hold / controlled-shutdown hardware | 1 future assembly | Allow Linux shutdown before ignition/master power disappears | Select a complete power path and runtime requirement first |
| Bulk/decoupling capacitors | As required by selected circuit | Supply stability per regulator/driver requirements | A capacitor alone is not a power source or complete Pi shutdown solution |
| USB-C panel input | 0 initially; 1 future | Optional common inlet | Exact PD/source contract and converter design unresolved |
| PD sink plus converter, if shared inlet chosen | 1 compatible set | Negotiate a supported input and regulate required outputs | Not needed for initial separate supplies; voltage/power not fixed |
| AirPods USB-C charging source | 1 usable output; existing charger may suffice | Wired charging selected; route a cable through the bottom of the v0.4 cup | No panel socket required initially; a bare connector/breakout is not a complete charging source |
| Short angled USB-C cable | 1 | Approximately 0.5 ft / 15 cm for shelf charging | Confirm both plug directions, access and source/case compatibility |
| Wireless charging puck/module | 0 initially; 1 optional | Complete compatible charger, tested through the Latercase | Deferred; v0.4 uses the bottom cable opening |
| Removable charger holder/backing | 1 if wireless chosen | Future shelf part plus appropriate fasteners | Puck dimensions and cable exit required first |

For truck power, first identify the actual supply point and its voltage/rating. Any converter wired to vehicle power must be suitable for that source and its transients; a bench buck board is not automatically an automotive power design. Keep the Garmin on its supplied/approved arrangement during accessory experiments.

## 6. Wiring supplies and tools

| Item | Starting quantity | Notes |
|---|---:|---|
| Stranded wire | Assortment / measured harness lengths | Choose power-wire gauge from current, length, voltage drop and protection; distinguish signal wires |
| Locking connectors and matching contacts | One mating pair per removable harness | Final pin counts, ratings and quantities follow the wiring plan |
| Heat-shrink, insulating sleeves and labels | Small assortment | Insulate joints and label both ends |
| Cable ties and suitable anchors | Small assortment | Provide service loops and keep fan/speaker paths clear |
| Prototype board or custom PCB | 1 if discrete interfaces used | Secure and insulate; solderless breadboard is for bench work |
| Soldering supplies / connector crimper | As needed | Match the chosen assembly method and contact series |
| Multimeter | 1 | Check supply, polarity and continuity |
| USB power meter | 1 useful bench tool | Match intended USB/PD modes; measure GPS/charging demand |
| Oscilloscope or suitable logic analyzer | Access for fan bench test | Verify PWM timing and signal levels with appropriate equipment |
| Calipers, ruler, precision driver | 1 each | Measure actual hardware and printed coupons |
| Drill/bits, deburring tool, rear access tools | As needed after fit approval | Match measured large bolts/cable protection; inspect behind holes first |

## 7. Later location tracking / home display

These are optional future features, not required for a working GPS mount, lights or fan.

- One supported external GNSS receiver and antenna if a usable live Garmin interface is not established.
- Matching USB/serial interface and a micro-USB OTG adapter if using the Pi's USB data port; powered hub only if the final USB load/port count needs one.
- One home display client if no suitable computer exists, with its own power, storage, display cable and monitor/TV.
- Optional mini-HDMI cable/adapter for local Pi setup; SSH can avoid this purchase.
- Network access for Tailscale/telemetry; no extra Wi-Fi adapter is presently specified for the Zero 2 W's built-in 2.4 GHz Wi-Fi.

## Home inventory to send back

| Check | What I have / measurement |
|---|---|
| Small screw box label and quantity | |
| Screw thread diameter / pitch / under-head length | |
| Screw head diameter and drive | |
| Nut across-flats width / thickness / thread | |
| Large bolt head / shank / pitch / length | Already owned; dimensions pending |
| Matching large nuts and rear washers | |
| Rubber thickness including adhesive | |
| Pi, fan, OLED, sensors or power modules already owned | |
| USB cable lengths and elbow directions | |

Photograph the package labels or place loose screws/nuts beside calipers. Check a known matching M2 nut threads on by hand; never force an uncertain thread. We can reuse verified hardware or deliberately revise the appropriate coupon/model before buying more.

