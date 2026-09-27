# Pico first, Linux Zero later

Updated 2026-09-27. [Hardware plan](hardware-v0.5.md) · [Tasks](todo.md) · [Existing simulation](../src/pi/README.md)

The current choice is a **Pico 2 WH for local control**, with a **Pi Zero 2 W** added later for a full OS. This supersedes the earlier Zero-only controller plan. `src/pi/` remains a Linux/Python simulation and is not firmware that can be flashed onto a Pico. No live hardware adapter or Pico firmware is implemented by the v0.5 CAD revision.

## Responsibilities

| Device / circuit | Planned responsibility |
|---|---|
| Pico 2 WH | Hardware fan PWM, tach counting, identified temperature sensor, LED dimming, debounced switches and local display |
| Separate power hardware | Regulation, protected load current, USB-C input/output behavior, load switching and power hold-up |
| Future Pi Zero 2 W | OS, SSH, network status, logging, maps, GNSS integration and home-display service |

The Pico must continue its local control policy when the Zero is absent, booting, shut down or disconnected. Network/display activity must not block fan updates. The Freenove board is a GPIO breakout, not the power regulator for the GPS or Zero.

## Proposed Pico pin reservation

This is a planning map using **GPIO numbers**, not physical header pin numbers or a ready-to-wire schematic. Confirm the selected modules and electrical interfaces before connecting them.

| GPIO | Reserved role |
|---|---|
| GP0 / GP1 | UART TX / RX to future Zero, using a common 3.3 V-compatible interface |
| GP4 / GP5 | I²C SDA / SCL for chosen display/module |
| GP6 | Temperature bus, if a compatible 1-Wire sensor is selected |
| GP10 | LED driver dimming request |
| GP12 | Fan hardware PWM request through the verified interface |
| GP13 | Fan tach input through its 3.3 V-compatible interface |
| GP14 | LED switch/button |
| GP15 | Fan auto/boost switch/button |
| GP16 | GPS switch state |
| GP17 | Master/shutdown request input |
| GP18 | GPS load-switch enable request |
| GP19 | Future Zero power enable request |
| GP20 | Future Zero shutdown-ready input, if that scheme is chosen |

A GPIO request cannot carry the GPS/fan/computer load. Keep the fan's regulated supply distinct from the PWM signal. Use the [selected four-pin fan connection plan](hardware-v0.5.md#fan-wiring-and-behavior). Verify PWM waveform, duty, startup and tach readings on the bench before connecting the Garmin.

## Firmware work still needed

1. Choose the supported Pico 2 W MicroPython build or C/C++ SDK and record its version. Recheck official instructions when doing the installation.
2. Implement bounded periodic control, hardware PWM and a watchdog. Start with the host simulation's tested policy as a reference, not a copy of its Linux code.
3. Acquire the identified temperature sensor with timeouts and explicit missing/CRC/stale faults. Never substitute 0°C for an error. A housing sensor is not the GPS battery's internal temperature.
4. Apply auto/boost control and fault priority. The earlier 35°C start, 32°C stop and 35–45°C ramp are bench proposals, not validated protection limits. Calibrate minimum stable duty and restart behavior with the real fan.
5. Debounce inputs and implement dim LED control. Make requested states distinct from measured power or RPM; absent feedback is unknown.
6. Add the selected OLED after control works. Display temperature, fault state, duty, optional RPM and switch state. A missing display must not halt cooling.
7. Add a bounded, versioned UART protocol with sequence numbers, timeouts and status/error replies. A stale host command must not defeat the local fallback policy. Do not make cooling depend on Wi-Fi.
8. Test boot/reset, missing sensor, stuck output, fan stall, disconnected host and recovery. Confirm the fan interface's electrical default state independently of firmware.

Programming USB access is intended with the rear carrier removed. Prevent backfeeding a USB host when an external supply is connected; follow the Pico datasheet's power arrangements. Measure the complete Freenove/Pico/header stack before installing it behind the GPS. Wi-Fi performance near the GPS and metal fasteners remains to test.

## Existing Linux simulation

Run with Python 3.11+; it imports no GPIO library and supports simulation only:

```sh
cd src/pi
python3 -m truck_gps --config config.example.toml --format json
python3 -m unittest discover -s tests -v
```

The existing package provides configuration validation, captured-sample parsing, fan hysteresis, auto/boost policy, LED requests, typed sensor faults, scenario playback and text/JSON output. Its example systemd unit deliberately denies device access. The earlier implementation recorded 21 passing software tests; this CAD revision does not add a physical hardware test claim.

Keep those pure policy tests when adapting behavior to the Pico, and add meaningful firmware/interface tests for timing and failure behavior. A future Linux package should consume Pico status rather than competing to drive the same fan/switch lines. Do not install `RPi.GPIO.PWM()` expecting that function to produce hardware PWM just because a PWM-capable pin was chosen.

## Future Zero bring-up

Install a currently supported Raspberry Pi OS Lite image using official setup guidance, configure SSH/network access, and start on a suitable bench supply. The Zero's native power connector is micro-USB. Its OS storage and power-down process differ from the Pico's firmware environment.

Run the simulation, then implement the Pico protocol client and logging. Add network/Tailscale status with timeouts. Keep credentials out of this repository. Define a shutdown request, confirmation, hold-up interval and load-switch circuit before using ignition/master power to disconnect Linux. A capacitor alone is not a shutdown controller.

Later, select an external GNSS receiver unless a usable Garmin live-position interface is verified. Implement stale/no-fix handling, timestamped tracks, distance calculations, year boundaries and storage retention before adding a home map or traffic API. Keep local logs useful during network loss. Existing API-price notes must be rechecked at implementation time.

## References

- [Pico 2 W datasheet](https://datasheets.raspberrypi.com/picow/pico-2-w-datasheet.pdf)
- [Pico-series official documentation](https://www.raspberrypi.com/documentation/microcontrollers/)
- [Zero 2 W product](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/)
- [Pi OS setup](https://www.raspberrypi.com/documentation/computers/getting-started.html)
- [Hardware choices and manufacturer sources](hardware-v0.5.md)
