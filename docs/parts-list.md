# Parts list and inventory

Updated 2026-09-27 for the [v0.5 prototype](../src/stl/v0.5/README.md). [Hardware plan](hardware-v0.5.md) · [Tasks](todo.md)

**Already owned:** the large dash bolts, cased AirPods and PopSocket. The rubber roll was supplied/described earlier. **Ordered:** M2 × 6 screws with nuts, and the ESR ring. The GPS is expected in the next few weeks. Other purchase/ownership status is unconfirmed.

This list separates the initial mechanical build from later electronics. Small fastener lengths are nominal CAD stacks, pending coupons and actual parts. Inventory your stock before buying more.

## Printed parts

| Item | Installed quantity | Notes |
|---|---:|---|
| Main insert, faceplate and shelf | 1 each | v0.5 prototype; settle head/ring dimensions before full print |
| Rear Pico/Freenove carrier | 1 | Also usable as a board-hole and stack test |
| Optional control pod and blank panel | 1 each | Check left trim clearance with thin outline first |
| Power tray, cover and blank inlet panel | 1 each when needed | Circuit/module not selected; reserve space only |
| Zero tray and cover | 1 each later | Future computer, not needed for GPS-only use |
| LED carrier | 1 later | Nominal two 3 mm LEDs, bore fit to test |
| Fit coupons | Per print queue | Not installed parts; [22-file index](../src/stl/v0.5/README.md#printable-parts-and-openscad-selectors) |
| Filament | Slicer estimate + test allowance | Select final material/profile for actual dashboard temperatures and printer capability |

## Fasteners for the current CAD

All M2 screws use 0.4 mm pitch and length measured **under the head**. Use plain M2 nuts, nominal 4 mm across flats × 1.6 mm thick, unless a stack is explicitly revised. The source defaults to 4.3 mm nut pockets and 2.2 mm screw bores.

| Joint | Screws | Nuts | Notes |
|---|---|---:|---|
| Faceplate | **4 × M2 × 6** | 4 | Ordered. Pan/button head ≤ about 4 mm diameter; no extra washer in this tight stack |
| Optional control pod to insert | **2 × M2 × 6** | 2 | Separate mounting tabs; does not share faceplate screws |
| Control-pod lid | **4 × M2 × 20** | 4 | Only needed with that pod |
| Rear carrier to insert | **4 × M2 × 8** | 4 | Head ≤4.4 mm diameter and **≤1.7 mm high** for flush recess |
| Freenove to carrier | **4 × M2 × 10** | 4 | Trial 1.6 mm PCB + 6 mm posts + 2.4 mm carrier; verify solder/trace clearance |
| Fan to printed frame | **4 × M2 × 25** | 4 | Trial padded fan stack; head fits 4.2 mm access bore. Small washers at nuts, about 0.2 mm nominal thickness, to test |
| Each shelf module and lid | **4 × M2 × 25** per module | 4 per module | Two modules = eight screws/nuts; nuts load into shelf-front recesses |
| Future Zero board to tray | **4 × M2 × 8** | 4 | Check small insulating washer needs and revise screw stack if required |
| Power inlet blank | **2 × M2 × 6** | 2 | Replaceable panel; only needed with power module |

If every optional module is assembled, the nominal totals are **M2 × 6: 8; M2 × 8: 8; M2 × 10: 4; M2 × 20: 4; M2 × 25: 12; plain M2 nuts: 36**, plus spares and suitable small washers/insulation. Do not buy the whole set before confirming the fan and PCB stacks. The owned dash hardware is additional to these totals.

M2.5/M3 parts, thicker locknuts, countersunk heads and longer faceplate screws are not direct substitutes. The supplied faceplate coupons establish nut fit and screw reach; the fan coupon establishes its different stack. Included Noctua screws/anti-vibration mounts are not automatically substitutes for the M2 frame arrangement.

## Dash, GPS and accessories

| Item | Quantity | Status / selection |
|---|---:|---|
| Large dash bolts | 4 | **Owned**; shanks pass the 7 mm test bore. Head size/length/pitch still to measure |
| Matching dash nuts | 4 | Match the owned thread; do not assume M6 and 1/4-inch interchangeability |
| Dash backing washers or plate | 4 washers or suitable plate | Match wall thickness, load area and rear access |
| Rubber pads | Small sheet/roll | Existing roll first; source assumes 1 mm uncompressed with 0.7 mm side allowance |
| Compatible pad adhesive | As needed | Existing backing may suffice; cure away from GPS and test on chosen plastic |
| Front gasket | About 0.6 m allowance | Test 1.2 × 0.6 mm groove and housing contact; pre-cured gasket maker is an alternative |
| ESR HaloLock Universal Ring 360 | 1 | **Ordered**, ASIN B09BZ17JM7; measure actual OD and adhesive stack |
| Ring adhesive | Supplied or suitable alternative | Smooth clean printed seat, heat/retention test; this holds the PopSocket only |
| Garmin OTR620 | 1 | Awaiting arrival; measure housing, rear features and screen bezel |
| Garmin supply/cable | 1 set | Use supplied/approved arrangement initially; actual power requirement unresolved |
| GPS right-angle USB-C cable | 1 if needed | Measure plugged-in projection and bend direction; cable jacket needs strain relief |
| Short AirPods USB-C cable | 1 | Bottom charging hole, actual angled plug test required |
| Cable grommet/bushing | Per drilled opening | Fit actual connector bundle and panel thickness |
| Insulated ties, sleeves and labels | Small assortment | Secure cable jackets and loose carrier; keep wiring away from fan |
| Precision screwdriver, calipers | 1 each | Match actual screw drive; measure stacks rather than forcing fit |

The supplied main insert still has a **10.8 mm trial head pocket**. Coupon choices are 10.6, 10.8, 11.0, 11.4, 11.8 and 12.2 mm across flats. The shelf shares the two lower dash bolts; there is no separate large shelf fastener purchase.

## Initial controller and accessories

| Item | Quantity | What is settled / remains |
|---|---:|---|
| Pico 2 WH | 1 | Selected header-equipped microcontroller; confirm purchase |
| Freenove FNK0081 breakout | 1 | Selected footprint; verify actual board revision and full header stack |
| Noctua **NF-A4x20 5V PWM** | 1 | Final choice is **four-pin**, not either earlier incompatible variant |
| Four-conductor fan harness | 1 usable harness | Reuse supplied extension if suitable; verify connector pin order |
| Fan PWM interface | 1 circuit | Select compatible CMOS-style driver/buffer and verify powered/unpowered conditions |
| Tach interface/pull-up | 1 circuit | 3.3 V-compatible input; verify actual fan output before wiring |
| Temperature sensor | 1 initially | DS18B20 considered; exact probe/module shape and cable length unselected |
| Sensor pull-up/harness | As required | Match chosen sensor/module and 3.3 V logic; avoid duplicate onboard pull-ups |
| Blue LEDs | 2 initially | Choose LED package/brightness; loose carrier has trial 3.3 mm bores |
| LED resistors and driver | 1 set | Calculate for selected LEDs/current/supply; provide dimming and hardware off behavior |
| Front controls | Up to 4 functions | Master/shutdown request, GPS, LEDs, fan auto/boost; exact switch bodies unselected |
| OLED | 1 optional | Exact module, driver, voltage, dimensions and connector clearance unselected |
| Insulating washers/barriers | As needed | Verify PCB hole diameter, metal washer footprint and underside solder clearance |
| Regulated accessory bench supply | 1 | Rated for the measured connected loads; do not power loads from GPIO |
| Programming cable | 1 | Pico uses micro-USB; program with carrier removed and prevent backfeed |

## Later power distribution and computer

| Item | Quantity | Decision still needed |
|---|---:|---|
| USB-C sink/PD module | 1 if combining input | Source contracts, ratings, connector mounting and actual footprint |
| Regulator/converter | As required | Thermal performance and continuous/peak load budget |
| Branch protection/load switches | Per controlled load | Current rating, default state, inrush and fault behavior |
| USB-C charging-source module | 1 for AirPods | Correct C-to-C source/CC behavior; not a bare parallel receptacle |
| Input/branch harnesses, connectors | Per selected circuit | Rated wires, service loops, labels and strain relief |
| Pico/Pi power ORing/hold-up circuitry | As required | Programming backfeed prevention and controlled Linux shutdown |
| Pi Zero 2 W | 1 later | Selected future Linux board; header variant and installed height to confirm |
| microSD card and reader | 1 each if needed | Supported OS image; size/endurance appropriate for logging |
| Suitable Zero bench supply / lead | 1 | Micro-USB at the Zero; budget supply headroom per official guidance |
| External GNSS receiver | 1 if needed | Garmin live-data output has not been verified |
| Home display computer / screen | Reuse if available | Later network/map phase |

Wireless AirPods charging is deferred. No wireless charging parts are needed for this revision. The power tray is only a mechanical reserve until a real circuit is selected and measured. Source links and electrical limits are in [hardware-v0.5.md](hardware-v0.5.md).
