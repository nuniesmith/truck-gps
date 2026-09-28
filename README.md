# Truck GPS mount and controller

A parametric Garmin OTR620 mount for the upper cubby of a **2022 Volvo VNL 860**, printed on an **Ender 3 Neo with a 220 × 220 mm bed**.

**Current print checkpoint: [v0.6 caliper fit tests](src/stl/v0.6/README.md).** The user confirmed a **170 mm clear inside width, 98 mm front height and 80 mm height below the rear notch**, plus cased AirPods measuring **64 x 49 x 24 mm**. Four updated coupons test these dimensions. **The v0.5 full insert and rear electronics layout need revision before printing:** its fan and carrier exceed the newly confirmed rear height. The complete electronics prototype remains archived in [v0.5](src/stl/v0.5/README.md).

The controller plan is now **Pico first, Linux Zero later**. This supersedes the earlier Zero-only control plan. `src/pi/` remains a simulation-only Python package; it has no live GPIO, Pico firmware, working power distribution or telemetry integration.

## Start here

- [Current fit coupons and measurement review](src/stl/v0.6/README.md)
- [Previous electronics prototype and assembly](src/stl/v0.5/README.md)
- [Hardware choices, fan variant and power architecture](docs/hardware-v0.5.md)
- [Complete staged parts list](docs/parts-list.md)
- [Current tasks and measurements](docs/todo.md)
- [Pico and future Linux implementation plan](docs/pi-setup.md)
- [Run the existing controller simulation](src/pi/README.md)
- [Recorded v0.2 truck tests](docs/fit-test-v0.2.md)
- [Conversation archive](docs/chats.md) and [v0.5 decision record](docs/decisions-v0.5.md)

## What has been checked physically

The user reports that the original front test frame fits, the 7 mm dash-bolt shank passage works, and the AirPods Pro 3 with Latercase fit snugly in the collar. The earlier **rear +10 mm** correction was implemented in v0.4/v0.5, but is now superseded by the confirmed **80 mm height below the rear notch**. The v0.6 gauges use the new measurements and have not yet been physically tested. The original bolt-head pocket was too tight; the current **10.8 mm** pocket remains a trial until a sizing coupon is selected. The existing ball mount will be removed. The rubber cubby liner may be removed if needed for seating.

No physical fit is claimed for the new fan, complete Pico stack, ESR recess, control pod, future Zero module, GPS bezel or angled GPS cable. Mesh validity and nominal CAD clearance are distinct from these tests.

## Mechanical layout

The following describes the previous prototype; its rear packing is pending revision.

| Area | v0.5 provision |
|---|---|
| Main cubby | Fan on the driver's-view left; Pico/Freenove carrier on the right; existing dash-bolt columns retained |
| GPS front | Removable gasketed faceplate using four ordered M2 × 6 screws and plain nuts |
| Ventilation | Lower speaker/intake slots and a matching-style upper exhaust row; microphone clearance retained |
| AirPods side | Tested collar section, front facing up at 45°, with bottom USB-C cable access |
| PopSocket side | Flat storage face with a trial recessed ESR target ring; no charging |
| Shelf underside | Removable future Pi Zero 2 W module and separate universal power module |
| Optional left pod | Replaceable blank front for a selected OLED and switches |
| Power inlet | Replaceable blank panel; USB-C hardware still to be selected |

The upper border cannot accommodate the full lower-slot height. Its shorter vents and shallow fan plenum need an airflow/noise test. No cooling performance is guaranteed by the CAD. The optional control pod and populated shelf need a radio/trim clearance check in the truck.

## Controllers and power

The **Pico 2 WH** will handle the local fan, temperature sensor, dim blue LEDs, buttons and display. The future **Pi Zero 2 W**, running a full OS, can provide network access, logging, maps and other services. Basic cooling must continue if that computer or its network connection fails.

The Pico sends control signals; a separate protected power circuit supplies the load current. Initially keep the Garmin on its supplied/approved power arrangement and power the accessories separately. The earlier 5 V / 1 A GPS estimate is unverified. A combined USB-C input requires a selected sink/PD design, rated regulation, protected outputs and proper USB-C charging-port behavior. A bare socket or splitter is insufficient. The Linux computer also needs a defined shutdown/power-hold arrangement.

**Fan selection:** use the exact **NF-A4x20 5V PWM** model. The recently linked B072Q3CMRW is the three-pin 5 V variant; the earlier B071W93333 is 12 V PWM. The final user decision is four-pin PWM at 5 V. See the [manufacturer-backed connection plan](docs/hardware-v0.5.md#fan-wiring-and-behavior).

## Revision history

| Directory | Role |
|---|---|
| [v0.1](src/stl/v0.1) | First Claude design and tests |
| [v0.2](src/stl/v0.2) | Rubber pads and accessory shelf; user's first reported fit tests |
| [v0.3](src/stl/v0.3) | ChatGPT V3.1 faceplate, M2 hardware and coupons |
| [v0.4](src/stl/v0.4) | Measured rear +10 mm, bolt-head coupons and wired AirPods shelf |
| [v0.5](src/stl/v0.5) | Previous electronics prototype; rear height superseded |
| [v0.6](src/stl/v0.6) | Four caliper-based fit coupons; full enclosure revision pending |

Older revisions and transcripts are preserved. The `v0.3` folder contains the CAD revision named V3.1; older `src/v0.x` paths and repository names in the archive are historical.

## Future software

The Linux simulation in `src/pi/` implements fan hysteresis, auto/boost policy, LED requests, typed sensor faults and text/JSON status. It does not operate physical hardware. A Pico firmware project and a bounded Pico-to-Pi protocol remain to be implemented. See [the implementation plan](docs/pi-setup.md).

Later goals include truck Wi-Fi/Starlink connectivity, a private Tailscale connection to a home display, trip history and a map. A live Garmin position interface has not been established; a separate GNSS receiver may be needed. Neither selected board has built-in GNSS. The existing [TomTom](docs/tomtom-api.md) and [Google Maps](docs/google-maps-api.md) notes are planning references; recheck terms and pricing when implementing those services.

Repository: [nuniesmith/truck-gps](https://github.com/nuniesmith/truck-gps).
