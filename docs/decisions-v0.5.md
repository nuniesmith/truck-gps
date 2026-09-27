# v0.5 request and decision record

Date: 2026-09-24. This is a concise decision record, not a reconstructed verbatim transcript of missing assistant turns. Earlier session text remains in [chats.md](chats.md).

The user asked to support a 40 × 40 × 20 mm fan, a Pico 2 WH microcontroller and, if practical, a future full-OS computer. They requested provisions for switches, a screen, temperature sensing, blue LEDs, USB-C intake/power distribution, the GPS and the future computer. The intended full-OS board is documented as Raspberry Pi Zero 2 W, distinct from the Pico.

They supplied Amazon links B071W93333, B0FC2QLC17, B0BFB53Y2N and B09BZ17JM7, asked for a flush recess for the ordered ESR ring, matching top/bottom vent styling, a faceplate and further test prints. They ordered M2 × 6 screws with nuts for the faceplate and expect the GPS in the next few weeks.

The later fan message was: “use this fan the 5v one”, linking B072Q3CMRW. That is the three-pin model. After the distinction was explained, the final user choice was: **“Yeah I want 4 pin pwm 5v”**. The active selection is therefore **Noctua NF-A4x20 5V PWM**, not either earlier incompatible fan variant.

Design decisions in this revision:

- Preserve the measured front fit, rear +10 mm, passing bolt-shank bore and snug AirPods collar section.
- Keep the head pocket, GPS envelope, ring dimensions and full electronics stack provisional until measured.
- Put the fan and Pico/Freenove inside the cubby; reserve separate shelf modules for future Zero and power circuitry.
- Keep control and inlet panels replaceable and blank until exact modules are selected.
- Use the Pico for local control and separate rated hardware for power delivery. Add Linux features later.
- Treat the airflow layout, PCB packing and screw stacks as prototypes requiring the supplied fit tests.

These choices are implemented in [v0.5](../src/stl/v0.5/README.md); the electrical circuit and firmware are not implemented by the CAD work.
