// V0.5 ELECTRONICS PROTOTYPE — retains measured v0.4 fit; see README.md.
// Read README.md: bolt-head and USB opening dimensions remain trial sizes.
// Garmin dezl OTR620 flush dash insert + hanging shelf  (v2)
// 2022 Volvo VNL 860 upper dash cubby
//
// v2: pocket sized for 1 mm rubber pads (removable friction fit), hanging shelf for
//     AirPods Pro 3 (Latercase) at 45 deg + MagSafe PopGrip seat, shelf locked in by
//     tongues that run under the insert and are clamped by the two bottom bolts.
//
// Units: mm. Design space: X = across (0 = left edge as the driver sees it),
// Y = up (0 = cubby floor), Z = depth (0 = front face, + goes into the dash).
// Printable solids get mirrored once so they come out with the right handedness.
//
// Export examples (see README.md for the complete list):
//   openscad --export-format binstl -D 'part="insert_v5"' -o insert_v5.stl otr620_vnl_v0_5.scad
//   openscad --export-format binstl -D 'part="shelf_v5"' -o shelf_v5.stl otr620_vnl_v0_5.scad
//   openscad --export-format binstl -D 'part="side_gauge"' -o side_gauge_plus10.stl otr620_vnl_v0_5.scad

part = "assembly"; // Set with -D. V5 dispatch and dimensions are at the end.

/* [Cubby: your measurements] */
open_w  = 165.1;  // 6-1/2"  opening width at the front edge
open_h  = 98.4;   // 3-7/8"  cubby floor (top of front lip) to top of opening
rear_step_raise = 10.0; // USER-MEASURED rise at the rear step; front height unchanged
low_h   = 79.4;   // original lower-height baseline; rear_step_raise corrects it
cubby_d = 50.8;   // 2"      front edge to back wall below the bar
bar_d   = 25.4;   // 1"      front edge to the face of the top bar

/* [Fit and draft] */
fit_side   = 0.30; // gap per side at the front edge
fit_top    = 0.40; // gap at the top edge
bar_gap    = 1.00; // gap to the face of the bar
low_gap    = 0.50; // gap under the bar
draft_side = 4.0;  // each side wall steps in this much at full depth (cubby walls taper)
draft_top  = 1.0;  // ceiling drops this much over the bar depth
draft_low  = 1.5;  // bar underside drops this much toward the back
draft_bot  = 0.5;  // floor rises this much toward the back

/* [GPS: dezl OTR620] */
gps_w  = 152.4;  // 6.0"
gps_h  = 86.4;   // 3.4"
gps_t  = 18.0;   // MEASURE YOUR UNIT (listings say 0.7" / 1.8 cm / 1.9 cm)
gps_r  = 2.0;    // pocket corner radius (device is ~2.3)
chin_h = 6.6;    // face below the screen, carries the speaker grille

/* [GPS retention] */
use_pads    = true; // true: rubber pads on walls + floor. false: VHB tape on the floor
pad_t       = 1.0;  // rubber pad thickness
pad_squeeze = 0.3;  // how much each wall pad gets compressed
fit_tape    = 0.5;  // gap per side when using tape instead of pads
tape_t      = 1.1;  // tape thickness (3M 5952 VHB = 1.1)

/* [Back-of-GPS features, front view, mm from GPS left edge / top edge] */
pwr   = [22.7, 13.1];  // power key (on the back!)
usb   = [42.6, 75.2];  // USB-C port (on the back, plug points straight back)
sd    = [ 9.1, 70.6];  // microSD slot
mnt   = [76.5, 47.9];  // mount socket recess
mic_x = 100.4;         // microphone hole on the top edge

/* [Bolts] */
bolt_d    = 7.0;           // channel, passes a 1/4" drill bit
head_af   = 10.8; // TRIAL: +0.5 mm over tested v0.2; use bolt_head_coupon before long print
seat_back = 12.0;          // from bolt-head seat to the back face (includes shelf tab)
bolt_x    = 13.0;          // channel centre from each side of the face
bolt_y    = [14.0, 64.0];  // channel heights above the floor (both below the bar)

/* [Speaker duct, grille, cable] */
win_x    = 24.0;  // duct window starts this far in from each side
win_top  = 46.0;  // top of the duct window (height above floor)
back_t   = 2.0;   // back plate that closes the duct
cable_d  = 20.0;  // cable pass-through in back plate, behind the USB-C port
bot_wall = 1.7;   // plastic under the grille slots
lip_t    = 1.5;   // plastic between grille slots and GPS
slot_l   = 6.0;
slot_rib = 2.0;
slot_n   = 13;
mic_w    = 8.0;
mic_dp   = 1.2;
pwr_relief_d  = 20.0;
pwr_relief_dp = 3.5;

/* [Shelf] */
shelf      = false;  // Legacy v2 preview/assertion flag only; V4 channels are always enabled
items_swap = false; // false: PopGrip on the left (driver side), AirPods on the right
shelf_gap  = 1.0;   // clearance between the shelf back and the trim below the cubby
rail_d     = 8.0;   // depth of the rail that sits against the bottom of the face
rail_top   = 1.5;   // rail height on the face (stays below the grille slots)
tongue_x   = 6.5;   // tongues start this far in from each side
tongue_w   = 15.0;
tongue_t   = 5.0;
tab_t      = 2.5;   // L-tab behind the insert; the bottom bolts pass through it
tab_h      = 24.0;

/* [AirPods Pro 3 in Latercase] */
ap_w     = 63.4;  // 62.2 case + 2 x 0.6 Latercase
ap_d     = 23.0;  // 21.8 + 1.2
ap_h     = 48.4;  // 47.2 + 1.2
ap_fit   = 0.4;   // gap per side in the socket
ap_depth = 30.0;  // how much of the case sits inside the socket
ap_wall  = 2.5;
ap_shift = 2.0;   // socket sits this far further down the slope than the PopGrip seat

/* [MagSafe PopGrip] */
pop_shape = "round"; // [round, oval]  round = current MagSafe PopGrip, oval = 2021 original
pop_d     = 57.9;    // round base diameter (2.28")
pop_ow    = 56.9;    // oval base width
pop_ol    = 90.0;    // oval base length
pop_fit   = 1.6;     // total clearance across the seat
pop_depth = 3.0;     // seat recess depth (stick a MagSafe metal ring on its floor)

$fn = 48;

// ---------- derived ----------
FIT     = use_pads ? pad_t - pad_squeeze : fit_tape;
FLOOR_T = use_pads ? pad_t : tape_t;
FW = open_w - 2*fit_side;
FH = open_h - fit_top;
LH = low_h - low_gap + rear_step_raise;
D  = cubby_d;
BD = bar_d - bar_gap;
PW = gps_w + 2*FIT;
PH = gps_h + 2*FIT;
PD = gps_t + FLOOR_T;
px0 = (FW - PW)/2;
py0 = chin_h;
gy0 = bot_wall;
gy1 = py0 - lip_t;
slot_h = gy1 - gy0;
z0  = gps_t + (py0 - gy0) + 0.8;      // duct roof depth at slot bottom (45 deg roof)
pitch = slot_l + slot_rib;
grille_w = slot_n*pitch - slot_rib;
trap_r = head_af/sqrt(3);             // hex circumradius

function gx(fx) = px0 + FIT + fx;
function gy(fy) = py0 + FIT + gps_h - fy;
function ds(z) = draft_side*z/D;
function db(z) = draft_bot*z/D;

// shelf geometry, 2D points are [y, z]
S2 = sqrt(2)/2;
W2 = [S2,  S2];   // up the 45 deg slope (toward the dash)
U2 = [S2, -S2];   // out of the slope (toward the driver)
pop_seat_w = (pop_shape == "round") ? pop_d + pop_fit : pop_ow + pop_fit;  // along slope
pop_seat_x = (pop_shape == "round") ? pop_d + pop_fit : pop_ol + pop_fit;  // across
seat_rim   = 1.75;
slope_top  = [rail_top - 0.4, -rail_d];
s_c        = 3.5 + pop_seat_w/2;
slope_len  = s_c + pop_seat_w/2 + seat_rim;
M_pop = slope_top - s_c*W2;
M_ap  = slope_top - (s_c + ap_shift)*W2;
S_bot = slope_top - slope_len*W2;
ap_sw = ap_w + 2*ap_fit;
ap_hw = (ap_d + 2*ap_fit)/2;
F_out = M_ap - (ap_depth + ap_wall)*U2;
C_low = F_out - (ap_hw + ap_wall)*W2;
y_bot = C_low[0];
k_b   = F_out[0] - F_out[1];            // shelf underside line: y = z + k_b
shelf_profile = [
    [rail_top, 0], [rail_top, -rail_d], slope_top, S_bot,
    [y_bot, S_bot[1]], [y_bot, y_bot - k_b],
    [k_b - shelf_gap, -shelf_gap], [-shelf_gap, -shelf_gap], [0, 0]   // 45 deg step: no support needed
];
ap_ow    = ap_sw + 2*ap_wall;
pop_ow_x = pop_seat_x + 2*seat_rim;
gap_items = max(0, min(6, FW - ap_ow - pop_ow_x - 2));
row_w  = ap_ow + gap_items + pop_ow_x;
row_x0 = (FW - row_w)/2;
pop_cx = items_swap ? row_x0 + ap_ow + gap_items + pop_ow_x/2 : row_x0 + pop_ow_x/2;
ap_cx  = items_swap ? row_x0 + ap_ow/2 : row_x0 + pop_ow_x + gap_items + ap_ow/2;
ap_top_pt   = M_ap + (ap_h - ap_depth)*U2 + ap_hw*W2;          // highest point of the case
ap_back_pt  = M_ap - ap_depth*U2 + ap_hw*W2;                   // deepest socket corner
tongue_x0 = [tongue_x, FW - tongue_x - tongue_w];
tongue_bx = [bolt_x, FW - bolt_x];

top_wall = (FH - draft_top*PD/BD) - (py0 + PH);
echo(str("face ", FW, " x ", FH, " | pocket ", PW, " x ", PH, " x ", PD,
         " | top wall behind GPS ", top_wall, " | chin ", chin_h));
echo(str("SHELF y_bot=", y_bot, " front_z=", S_bot[1], " ap_cx=", ap_cx, " pop_cx=", pop_cx,
         " ap_top_y=", ap_top_pt[0], " M_ap=", M_ap, " M_pop=", M_pop));
assert(top_wall - mic_dp >= 1.2, "Top wall too thin: reduce chin_h or draft_top");
assert(z0 - (py0 - gy0) >= gps_t, "Grille duct would undercut the GPS");
assert(bolt_x - trap_r >= px0 + 0.5, "Side hex traps must open fully into the pocket");
assert(bolt_y[0] - head_af/2 >= py0 + 0.5, "Lower hex traps must open fully into the pocket");
assert(bolt_x + trap_r <= win_x - 3, "Hex traps too close to the duct window");
assert(bolt_y[1] + trap_r <= LH - draft_low - 3, "Upper bolts too close to the bar");
assert(!shelf || ap_top_pt[0] <= -0.5, "AirPods would stick up past the cubby floor line");
assert(!shelf || ap_back_pt[1] <= -shelf_gap - 2, "AirPods socket too close to the shelf back");
assert(!shelf || tongue_x + tongue_w + 0.3 <= win_x - 2, "Tongue channel too close to the duct");
assert(!shelf || (bolt_x > tongue_x + bolt_d/2 + 2 && bolt_x < tongue_x + tongue_w - bolt_d/2 - 2),
       "Bottom bolts must pass through the shelf tabs");
assert(!shelf || tongue_t + 0.3 <= py0 - 1.2, "Tongue channel too close to the GPS pocket");

// ---------- helpers ----------
module rrect(w, h, r) offset(r) offset(-r) square([w, h]);
module slab(z, x0, x1, y0, y1) translate([x0, y0, z]) cube([x1 - x0, y1 - y0, 0.01]);
module to_physical() mirror([0, 0, 1]) children();  // design space is left-handed
module stadium2d(w, h) hull() {
    translate([-(w/2 - h/2), 0]) circle(d = h);
    translate([ (w/2 - h/2), 0]) circle(d = h);
}
module teardrop2d(r) hull() { circle(r); polygon([[-r*S2, r*S2], [r*S2, r*S2], [0, r/S2]]); }
module profile_x(x0, len, pts) translate([x0, 0, 0]) rotate([90, 0, 90]) linear_extrude(len) polygon(pts);
// local frame on the shelf slope: X across, Y up-slope, Z into the shelf
module on_slope(c) multmatrix([[1, 0, 0, 0], [0, S2, -S2, c[0]], [0, S2, S2, c[1]], [0, 0, 0, 1]]) children();
module seat2d() if (pop_shape == "round") circle(d = pop_seat_w, $fn = 96);
                else stadium2d(pop_seat_x, pop_seat_w);

// ---------- insert (design space) ----------
module envelope() {
    hull() {  // full-height front section, stops short of the bar
        slab(0, 0, FW, 0, FH);
        slab(BD - 0.01, ds(BD), FW - ds(BD), db(BD), FH - draft_top);
    }
    hull() {  // lower section, full depth
        slab(0, 0, FW, 0, LH);
        slab(D - 0.01, ds(D), FW - ds(D), db(D), LH - draft_low);
    }
}

module gps_pocket()
    translate([px0, py0, -1]) linear_extrude(PD + 1) rrect(PW, PH, gps_r);

module mic_groove()
    translate([gx(mic_x) - mic_w/2, py0 + PH - 0.5, -1]) cube([mic_w, mic_dp + 0.5, PD + 1]);

module duct() {
    translate([win_x, py0 - 0.01, PD - 0.01])
        linear_extrude(D - back_t - PD + 0.01)
            union() {
                rrect(FW - 2*win_x, win_top - py0 + 0.01, 4);
                square([FW - 2*win_x, 5]);
            }
    profile_x(win_x, FW - 2*win_x,
              [[gy0, z0], [py0 + 0.02, z0 - (py0 - gy0) - 0.02],
               [py0 + 0.02, D - back_t], [gy0, D - back_t]]);
    for (i = [0 : slot_n - 1])
        translate([FW/2 - grille_w/2 + i*pitch, gy0, -1])
            linear_extrude(z0 + 1.5)
                hull() {
                    translate([slot_h/2, slot_h/2]) circle(d = slot_h);
                    translate([slot_l - slot_h/2, slot_h/2]) circle(d = slot_h);
                }
}

module reliefs() {
    translate([gx(pwr[0]), gy(pwr[1]), PD - 0.01]) cylinder(d = pwr_relief_d, h = pwr_relief_dp);
    translate([gx(sd[0]) - 7, gy(sd[1]) - 9, PD - 0.01]) cube([14, 18, 2.5]);
    translate([gx(mnt[0]), gy(mnt[1]), PD - 0.01]) cylinder(r = 29, h = 1.5);
}

module bolts() {
    for (bx = [bolt_x, FW - bolt_x], by = bolt_y) {
        translate([bx, by, PD - 0.01]) cylinder(d = bolt_d, h = D);
        translate([bx, by, PD - 0.01])
            cylinder(r = trap_r, h = D - seat_back - PD + 0.01, $fn = 6);
    }
}

module cable_hole()
    translate([gx(usb[0]), gy(usb[1]), D - back_t - 1]) cylinder(d = cable_d, h = back_t + 2);

module shelf_channels() for (x0 = tongue_x0) {
    xc = x0 - 0.3;
    translate([xc, -1, -1]) cube([tongue_w + 0.6, tongue_t + 1.3, D + 2]);            // under-floor channel
    translate([xc, -1, D - tab_t - 0.3]) cube([tongue_w + 0.6, tab_h + 1.3, tab_t + 1.3]); // L-tab pocket
    profile_x(xc, tongue_w + 0.6,
              [[tongue_t + 0.29, D - tab_t - 0.29], [tongue_t + 3.1, D - tab_t - 0.29],
               [tongue_t + 0.29, D - tab_t - 3.1]]);
}

module insert_design()
    difference() {
        envelope();
        gps_pocket();
        mic_groove();
        duct();
        reliefs();
        bolts();
        cable_hole();
        shelf_channels();
    }

// ---------- shelf (design space) ----------
module ap_socket() on_slope(M_ap) translate([ap_cx, 0, 0]) {
    translate([0, 0, -3]) linear_extrude(ap_depth + 3) stadium2d(ap_sw, 2*ap_hw);
    hull() {
        translate([0, 0, -0.01]) linear_extrude(0.01) offset(1.2) stadium2d(ap_sw, 2*ap_hw);
        translate([0, 0, 1.2]) linear_extrude(0.01) stadium2d(ap_sw, 2*ap_hw);
    }
    translate([0, 0, ap_depth - 0.1]) linear_extrude(ap_wall + 3) stadium2d(14, 6);  // crumb drain
}

module pop_seat() on_slope(M_pop) translate([pop_cx, 0, 0]) {
    translate([0, 0, -3]) linear_extrude(pop_depth + 3) seat2d();
    hull() {
        translate([0, 0, -0.01]) linear_extrude(0.01) offset(0.8) seat2d();
        translate([0, 0, 0.8]) linear_extrude(0.01) seat2d();
    }
}

module tongue_solid(x0) {
    translate([x0, 0, -rail_d]) cube([tongue_w, tongue_t, rail_d + D]);   // ear + tongue
    translate([x0, 0, D - tab_t]) cube([tongue_w, tab_h, tab_t]);         // L-tab
    profile_x(x0, tongue_w,                                               // inside chamfer
              [[tongue_t - 0.01, D - tab_t + 0.01], [tongue_t + 2, D - tab_t + 0.01],
               [tongue_t - 0.01, D - tab_t - 2]]);
}

module tongue_cuts(x0, bx) {
    profile_x(x0 - 1, tongue_w + 2, [[-1, D + 1], [3, D + 1], [-1, D - 3]]);  // clears floor/wall fillet
    translate([bx, bolt_y[0], D - tab_t - 1]) linear_extrude(tab_t + 2) teardrop2d(bolt_d/2);
}

module shelf_design()
    difference() {
        union() {
            profile_x(0, FW, shelf_profile);
            for (x0 = tongue_x0) tongue_solid(x0);
        }
        ap_socket();
        pop_seat();
        for (i = [0, 1]) tongue_cuts(tongue_x0[i], tongue_bx[i]);
    }

// ---------- preview stand-ins ----------
module gps_design() translate([px0 + FIT, py0 + FIT, 0.02]) {
    color([0.08, 0.08, 0.09]) linear_extrude(gps_t) rrect(gps_w, gps_h, 2.3);
    color([0.15, 0.35, 0.55]) translate([12, 5, -0.05]) cube([gps_w - 17, gps_h - 10, 0.1]);
}
module items_design() {
    on_slope(M_ap) translate([ap_cx, 0, ap_depth]) mirror([0, 0, 1])
        color([0.93, 0.93, 0.95]) linear_extrude(ap_h) stadium2d(ap_w, ap_d);
    on_slope(M_pop) translate([pop_cx, 0, pop_depth]) mirror([0, 0, 1]) {
        color([0.12, 0.12, 0.14]) linear_extrude(4.5)
            if (pop_shape == "round") circle(d = pop_d, $fn = 96); else stadium2d(pop_ol, pop_ow);
        color([0.85, 0.35, 0.15]) translate([0, 0, 4.4]) linear_extrude(4.5) circle(d = 38);
    }
}

// ---------- printable parts ----------
// Insert: back face down, face up. Supports "touching build plate" for the strip that
// sits in front of the bar; everything else is self-supporting.
module print_insert() translate([0, 0, D]) to_physical() insert_design();

// Shelf: printed upright, flat bottom on the bed. Supports "touching build plate" catch
// the two tongues; the shelf body itself is self-supporting.
module print_shelf()
    translate([0, 0, -y_bot]) multmatrix([[1, 0, 0, 0], [0, 0, 1, 0], [0, 1, 0, 0], [0, 0, 0, 1]])
        shelf_design();

module print_fit_frame()
    translate([0, FH, 0]) mirror([0, 1, 0])
        intersection() {
            insert_design();
            translate([-1, -1, -1]) cube([FW + 2, FH + 2, 5]);
        }

gauge_t = 3.0;
module side_profile_2d()
    polygon([[0, 0], [0, FH], [BD, FH - draft_top], [BD, LH - draft_low*BD/D],
             [D, LH - draft_low], [D, db(D)]]);
module plan_profile_2d()
    polygon([[0, 0], [FW, 0], [FW - ds(D), D], [ds(D), D]]);
module outline_2d(rim = 6) difference() { children(); offset(delta = -rim) children(); }
module gauge_label(s)
    linear_extrude(gauge_t + 0.6) text(s, size = 4.5, font = "DejaVu Sans:style=Bold",
                                       halign = "center", valign = "center");
module print_fit_gauge() {
    linear_extrude(gauge_t) outline_2d() plan_profile_2d();
    translate([FW/2, 3, 0]) gauge_label("FRONT");
    translate([FW/2, D - 3, 0]) gauge_label("TOP GAUGE");
    translate([0, D + 6, 0]) {
        linear_extrude(gauge_t) outline_2d() mirror([1, -1, 0]) side_profile_2d();
        translate([FH/2, 3, 0]) gauge_label("FRONT");
        translate([(LH - draft_low)/2, D - 3, 0]) gauge_label("SIDE GAUGE");
    }
}

module print_bolt_test() {
    h = D - PD;
    difference() {
        translate([-10, -10, 0]) cube([20, 20, h]);
        translate([0, 0, -1]) cylinder(d = bolt_d, h = h + 2);
        translate([0, 0, seat_back]) cylinder(r = trap_r, h = h, $fn = 6);
    }
}

// Shelf pocket test: AirPods collar (slide it over the cased AirPods) and a PopGrip seat
module print_pocket_test() {
    linear_extrude(12) difference() {
        offset(2.4) stadium2d(ap_sw, 2*ap_hw);
        stadium2d(ap_sw, 2*ap_hw);
    }
    translate([ap_sw/2 + 10 + pop_seat_x/2, 0, 0]) {
        linear_extrude(1.2) offset(2.4) seat2d();
        linear_extrude(1.2 + pop_depth) difference() { offset(2.4) seat2d(); seat2d(); }
    }
}


// ==================== SHARED V3.1 FACEPLATE / V4 FIT REVISION ====================
// Override part on command line: -D 'part="insert_v3"'
// Original helpers above are retained for traceability; v3 dispatch is below.
bezel_overlap=1.2;       // ASSUMED safe housing overlap; confirm screen boundary
bezel_t=2.4;
bezel_gap=0.3;           // distance from nominal GPS face to bezel rear
flange_t=4.2;           // front mounting tabs, outside the cubby envelope
nut_af=4.3;              // nominal M2 hex nut + print allowance; test coupon
nut_slot_t=1.8;          // nominal 1.6 mm nut + clearance
nut_back_wall=0.4;       // retains nut axially; screw must not contact this wall
lug_extension=6;
lug_half_h=6;
nut_rear_z=-nut_back_wall;
nut_front_z=nut_rear_z-nut_slot_t;
bezel_clear=2.2;
bezel_screw_len=6;       // nominal M2 x 6 machine screw, measured below head
bezel_y=[22,70];
bezel_x=[-2.8,FW+2.8];
gasket_w=1.2;
gasket_depth=0.6;        // use ~1 mm strip, adjust after compression test
usb_window_w=30;         // provisional routing clearance, not measured plug size
usb_window_h=16;
tray_len=102;
tray_t=4;
ap_tray_w=ap_w+0.8;
ap_tray_h=ap_h+0.8;
ap_lip=8;
steel_ring_od=55;        // PLACEHOLDER: measure purchased target ring
steel_ring_id=43;
steel_ring_t=1;
led_d=3.3;              // test fit for nominal 3 mm LED; no electronics supplied

assert(nut_front_z+flange_t>=1.5,"Nut pocket front bearing wall too thin");
assert(bezel_screw_len-flange_t-bezel_t > nut_front_z+1.2,"Screw thread engagement insufficient");
assert(bezel_screw_len-flange_t-bezel_t <= nut_rear_z,"Screw would hit rear skin");
assert(FW+2*lug_extension+20<=220,"Faceplate plus 10 mm brim exceeds declared bed");
module bezel_screws(z,h,d) for(x=bezel_x,y=bezel_y)
 translate([x,y,z]) cylinder(d=d,h=h);
// Nuts load through the TOP of each tab before installation. The slot flats
// prevent rotation and the front/rear skins prevent axial escape. Cover each
// entry with removable tape after testing to retain nuts while screws are absent.
module nut_slot(af=nut_af){
 translate([0,0,nut_front_z]) linear_extrude(nut_slot_t) union(){
  rotate(30) circle(r=af/sqrt(3),$fn=6);
  translate([-af/2,0]) square([af,lug_half_h+0.2]);
 }
}
module flange_tabs_2d(){
 for(y=bezel_y){
  translate([-lug_extension,y-lug_half_h]) rrect(lug_extension+4.8,2*lug_half_h,1);
  translate([FW-4.8,y-lug_half_h]) rrect(lug_extension+4.8,2*lug_half_h,1);
 }
}
module front_tabs() union(){
 translate([0,0,-flange_t]) linear_extrude(flange_t) flange_tabs_2d();
 // Inside-wall overlaps tie the tabs to the insert without changing its cubby fit.
 // A 0.01 mm internal overlap avoids coincident edges at the rounded tabs.
 // External tab width, front opening and fastener positions stay unchanged.
 for(y=bezel_y,x=[1,FW-4.8]) translate([x-0.01,y-lug_half_h,-flange_t])
  cube([3.82,2*lug_half_h,flange_t+2]);
}
module v3_insert() difference(){
 union(){insert_design();front_tabs();}
 bezel_screws(-flange_t-0.1,flange_t+0.2,bezel_clear);
 for(x=bezel_x,y=bezel_y) translate([x,y,0]) nut_slot();
 translate([gx(usb[0])-usb_window_w/2,gy(usb[1])-usb_window_h/2,D-back_t-0.1])
 linear_extrude(back_t+0.2) rrect(usb_window_w,usb_window_h,2);
 for(y=[gy(usb[1])-6,gy(usb[1])+6])
 translate([gx(usb[0])+26,y-2,D-back_t-0.1]) cube([2,4,back_t+0.2]);
}
// Ring on bezel rear. Bearing area must land on plastic housing, never glass.
module bezel_opening(delta=0){
 translate([px0+FIT+bezel_overlap-delta,py0+FIT+bezel_overlap-delta])
 rrect(gps_w-2*bezel_overlap+2*delta,gps_h-2*bezel_overlap+2*delta,2);
}
module bezel_2d() difference(){
 translate([0,py0-0.6]) rrect(FW,FH-py0+0.6,2);
 bezel_opening();
}
module v3_bezel() difference(){
 union(){
  translate([0,0,-flange_t-bezel_t]) linear_extrude(bezel_t)
   union(){bezel_2d();flange_tabs_2d();}
  // Rear return brings the gasket to the original GPS plane despite raised tabs.
  translate([0,0,-flange_t-0.01]) linear_extrude(flange_t-bezel_gap+0.01)
   difference(){
    bezel_2d();
    offset(0.2) union(){
     flange_tabs_2d();
     for(y=bezel_y,x=[1,FW-4.8]) translate([x,y-lug_half_h]) square([3.8,2*lug_half_h]);
    }
   }
 }
 bezel_screws(-flange_t-bezel_t-0.1,bezel_t+0.2,bezel_clear);
 translate([0,0,-bezel_gap-gasket_depth]) linear_extrude(gasket_depth+0.1)
 difference(){bezel_opening(0.3+gasket_w);bezel_opening(0.3);}
 translate([gx(mic_x)-mic_w/2,py0+PH-0.5,-flange_t-bezel_t-0.1])
 cube([mic_w,FH,flange_t+bezel_t+0.2]);
}
// Independent shelf uses original L-tabs, with oval accessory oriented down slope.
module tray_frame() on_slope(slope_top-tray_len/2*W2) children();
pop3_x=43;
ap3_x=121;
ap3_s=52;
pop3_s=51;
assert(pop3_x-(pop_ow+1.2)/2-2.5>0,"Oval pocket exceeds shelf edge");
assert(ap3_x+ap_tray_w/2+2.5<FW,"AirPods tray exceeds shelf edge");
assert(pop3_x+(pop_ow+1.2)/2+2.5 < ap3_x-ap_tray_w/2-2.5,"Accessory rims overlap");
assert(slope_top[0]-(ap3_s-ap_tray_h/2)*S2+ap_d*S2 < -1,"AirPods too high; move down slope");
module at_item(x,s) on_slope(slope_top-s*W2) translate([x,0,0]) children();
module oval_up(w,h) rotate(90) stadium2d(h,w);
module ap_outline() rrect(ap_tray_w,ap_tray_h,7);
// V4: reproduce the tested v0.2 width/depth collar at the case bottom.
// The case height runs UP the shelf slope; broad front faces up/toward driver.
ap_collar_h=12;       // same wall height as the successful v0.2 collar
ap_floor_t=2.5;
ap_charge_w=18;       // TRIAL plug-body clearance; test actual USB-C cable
ap_charge_d=10;
ap_charge_r=2;
ap_charge_x=0;        // adjust if actual cased port is not centered
ap_charge_z=0;
assert(ap_charge_w < ap_sw-2*ap_wall, "Charging opening leaves too little bottom support");
assert(ap_charge_d < 2*ap_hw-2, "Charging opening exceeds tested case thickness");
module charging_opening_2d()
 translate([-ap_charge_w/2,-ap_charge_d/2])
 rrect(ap_charge_w,ap_charge_d,ap_charge_r);
module airpods_collar_local() difference(){
 linear_extrude(ap_floor_t+ap_collar_h)
  offset(ap_wall) stadium2d(ap_sw,2*ap_hw);
 translate([0,0,ap_floor_t]) linear_extrude(ap_collar_h+0.1)
  stadium2d(ap_sw,2*ap_hw);
 translate([ap_charge_x,ap_charge_z,-0.1]) linear_extrude(ap_floor_t+0.2)
  charging_opening_2d();
}
module airpods_on_tray(){
 // Map collar extrusion +Z to tray +Y (up slope).
 translate([0,-ap_h/2-ap_floor_t,-ap_d/2]) rotate([-90,0,0])
  airpods_collar_local();
}
module v4_shelf() difference(){
 union(){
  tray_frame() translate([0,-tray_len/2,0]) cube([FW,tray_len,tray_t]);
  translate([0,-3,-rail_d]) cube([FW,rail_top+3,rail_d]);
  for(x0=tongue_x0) tongue_solid(x0);
  at_item(pop3_x,pop3_s) translate([0,0,-3]) linear_extrude(3.2)
   difference(){offset(2.5) oval_up(pop_ow+1.2,pop_ol+1.2);oval_up(pop_ow+1.2,pop_ol+1.2);}
  at_item(ap3_x,ap3_s) airpods_on_tray();
 }
 for(i=[0,1]) tongue_cuts(tongue_x0[i],tongue_bx[i]);
 at_item(pop3_x,pop3_s) translate([0,0,-0.1]) linear_extrude(steel_ring_t+0.1)
  difference(){circle(d=steel_ring_od);circle(d=steel_ring_id);}
 // Preserve provisional future bracket holes. No electronics cutouts finalized.
 at_item(ap3_x,92) for(x=[-10,10]) translate([x,0,-0.1]) cylinder(d=3.2,h=tray_t+0.2);
}
module side_gauge_v4(){
 linear_extrude(gauge_t) outline_2d() mirror([1,-1,0]) side_profile_2d();
 translate([FH/2,3,0]) gauge_label("FRONT");
 translate([(LH-draft_low)/2,D-3,0]) gauge_label("V4 +10");
}
module bolt_head_coupon_v4(){
 sizes=[10.6,10.8,11.0,11.4,11.8,12.2];
 for(i=[0:len(sizes)-1]) translate([i*27,0,0]) {
  difference(){
   cube([24,28,8]);
   translate([12,16,-0.1]) cylinder(d=bolt_d,h=8.2);
   translate([12,16,2]) cylinder(r=sizes[i]/sqrt(3),h=6.1,$fn=6);
  }
  translate([12,3,7.99]) linear_extrude(0.6)
   text(str(sizes[i]),size=3,font="DejaVu Sans:style=Bold",halign="center",valign="center");
 }
}
module airpods_standin_v4(){
 // Same stadium cross-section as v0.2, raised off intended support by 0.02.
 translate([0,-ap_h/2+0.02,-ap_d/2]) rotate([-90,0,0])
  linear_extrude(ap_h) stadium2d(ap_w,ap_d);
}
// Simple LED carrier: screw onto back plate only after testing placement/sound.
// Loose part intentionally not installed: exact LED body/wire clearance unmeasured.
module led_carrier() difference(){
 cube([24,10,5]);
 for(x=[5,19]) translate([x,5,-0.1]) cylinder(d=led_d,h=5.2);
 translate([12,5,-0.1]) cylinder(d=2.2,h=5.2);
}
module nut_coupon(){
 // Three blocks, AF 4.1 / 4.3 / 4.5 from left to right; slots face +Y.
 for(i=[0:2]) translate([18*i,0,flange_t]) difference(){
  translate([-6,-6,-flange_t]) cube([12,12,flange_t]);
  nut_slot(4.1+0.2*i);
  translate([0,0,-flange_t-0.1]) cylinder(d=bezel_clear,h=flange_t+0.2);
 }
}
module bolt_cover_coupon(){
 for(i=[0:2]) translate([18*i,0,0]) difference(){
  translate([-6,-6,0]) cube([12,12,bezel_t]);
  translate([0,0,-0.1]) cylinder(d=bezel_clear,h=bezel_t+0.2);
 }
}
module truck_frame(){
 translate([0,0,4]) to_physical() intersection(){
  v3_insert(); translate([-lug_extension-1,-1,-flange_t-0.1])
  cube([FW+2*lug_extension+2,FH+2,flange_t+4.1]);
 }
}
module pad_coupon(){
 // Three U-shaped samples. Openings 20 mm + two compressed pad allowances.
 for(i=[0:2]) translate([i*30,0,0]) difference(){
 cube([26,20,8]);
 translate([(26-(20+2*(0.5+0.2*i)))/2,3,-0.1]) cube([20+2*(0.5+0.2*i),18,8.2]);
 }
}
module assembly_v4(){
 color([0.40,0.44,0.48]) v3_insert();
 color([0.24,0.28,0.33]) v4_shelf();
 color([0.65,0.68,0.72]) v3_bezel();
 gps_design();
 at_item(ap3_x,ap3_s) color([0.90,0.92,0.93]) airpods_standin_v4();
 at_item(pop3_x,pop3_s) color([0.35,0.40,0.52])
 translate([0,0,-4]) linear_extrude(4) oval_up(pop_ow,pop_ol);
}
module print_shelf_v4() translate([0,0,-slope_top[0]+(tray_len+tray_t)*S2])
 multmatrix([[1,0,0,0],[0,0,1,0],[0,1,0,0],[0,0,0,1]]) v4_shelf();
assert(rear_step_raise>=0 && LH < FH-draft_top, "Rear step must remain below front roof");

// ==================== V0.5 ELECTRONICS PROTOTYPE ====================
// No electronics are supplied by these STLs. Dimensions marked TRIAL need
// the actual parts. Retain the 164.5 x 98 front and measured rear +10 mm.
fan_xy=[47,62];
fan_front=24;
fan_pad_depth=22;       // Noctua NF-A4x20 5V PWM including anti-vibration pads
fan_hole_pitch=32;
fan_frame_front=22;
fan_frame_t=2;
carrier_front=48.4;
carrier_t=2.4;
carrier_rect=[22.6,6.6,119.3,79.6];
carrier_screws=[[26.5,10],[138,10],[72.5,82],[137.5,82]];
fnk_origin=[75,19];
fnk_size=[63,57];       // Freenove CB8101 mechanical drawing v1.1
fnk_pitch=[58,52];
fnk_post_h=6;
fnk_pcb_t=1.6;         // TRIAL: verify the purchased PCB thickness
fnk_stack=21;          // TRIAL assembly envelope from back of breakout PCB
top_slot_front_h=1.6;  // available upper border is much thinner than the chin
top_slot_rear_h=1.0;
top_slot_y=95.0;
esr_recess_d=57.5;     // TRIAL: measure actual ESR HaloLock Ring 360 OD
esr_recess_depth=0.6;  // TRIAL: ring + adhesive; use depth coupon before shelf
control_y=[38,54];
pod_x0=-42;
pod_x1=-8;
pod_y0=4;
pod_y1=94;
pod_front=-22;
pod_back=-4.2;
module_s=55;
module_h=42;
module_floor=6;        // 2 mm gap behind 4 mm shelf
module_lid=23;
module_lid_t=2;
zero_w=76;
power_w=68;

assert(fan_front+fan_pad_depth<carrier_front,"No rear fan intake clearance");
assert(fnk_origin[0]+fnk_size[0]<FW-win_x,"Freenove PCB outside bay");
assert(carrier_front-fnk_post_h-fnk_stack>PD,"Pico stack reaches GPS");
assert(esr_recess_depth>0 && esr_recess_depth<tray_t-1.5,"Ring recess too deep");
assert(ap3_x+zero_w/2<FW,"Zero module exceeds shelf width");
assert(pop3_x+power_w/2<ap3_x-zero_w/2,"Shelf modules overlap");

module zhole(x,y,z,h,d=2.2) translate([x,y,z]) cylinder(d=d,h=h);
module hexhole(x,y,z,h,af=4.3) translate([x,y,z]) rotate([0,0,30]) cylinder(r=af/sqrt(3),h=h,$fn=6);
module rect3(x,y,z,w,h,t,r=0) translate([x,y,z]) linear_extrude(t) rrect(w,h,r);
module centered_capsule(w,h) stadium2d(w,h);
module fan_bolts(z,h,d=2.2) for(x=[-16,16],y=[-16,16])
 zhole(fan_xy[0]+x,fan_xy[1]+y,z,h,d);
module fnk_holes(z,h,d=2.2) for(x=[2.5,60.5],y=[2.5,54.5])
 zhole(fnk_origin[0]+x,fnk_origin[1]+y,z,h,d);

// Full-depth bay preserves side bolt columns and rear shelf tongue pockets.
module electronics_bay(){
 rect3(24,8,PD+0.1,FW-48,77,carrier_front-PD+0.9,1.5);
 rect3(carrier_rect[0]-0.3,carrier_rect[1]-0.3,carrier_front,
       carrier_rect[2]+0.6,carrier_rect[3]+0.6,D-carrier_front+0.2,1);
}
module rear_carrier_bosses() for(p=carrier_screws) translate([p[0],p[1],42.2])
 cylinder(r=4,h=47.2-42.2);
module carrier_boss_cuts() for(p=carrier_screws){
 zhole(p[0],p[1],40,12);
 hexhole(p[0],p[1],42.1,1.9);
}
module control_tabs_2d() for(y=control_y)
 translate([-6,y-4]) rrect(10.8,8,1);
module control_tabs(){
 translate([0,0,-flange_t]) linear_extrude(flange_t) control_tabs_2d();
 for(y=control_y) rect3(0.99,y-4,-flange_t,3.82,8,flange_t+2);
}
module control_tab_cuts() for(y=control_y){
 zhole(-2.8,y,-flange_t-0.1,flange_t+0.2);
 translate([-2.8,y,0]) nut_slot();
}

// Fan exhaust plenum is in front of fan; rear of fan takes air from the bay.
// Narrow paths are deliberate packing compromises, NOT proven airflow.
module fan_plenum_solid(){
 rect3(23.0,39,20.6,47.0,46,3.4,1);
 rect3(24.0,82.3,20.6,46.0,13.2,3.75,0.5);
}
module fan_plenum_air(){
 // 1 mm front wall clears the nominal 20.5 mm rear mounting-socket relief.
 rect3(25.2,41.2,21.6,42.6,42.6,2.5,0.5);
 rect3(26,82,21.6,42,13.4,1.8,0.5);
 rect3(30,94.7,20.7,104,1.4,2.7,0.4);
}
module fan_mount_frame() difference(){
 rect3(fan_xy[0]-22,fan_xy[1]-22,fan_frame_front,44,44,fan_frame_t,1);
 zhole(fan_xy[0],fan_xy[1],fan_frame_front-0.1,fan_frame_t+0.2,37);
}
module fan_mount_cuts(){
 fan_bolts(19.8,5);
 fan_bolts(20.5,2.5,4.2); // driver/head access; M2 head bearing seat at Z=23
}
function top_slot_x(i)=FW/2-grille_w/2+i*pitch+slot_l/2;
function top_slot_enabled(i)=abs(top_slot_x(i)-gx(mic_x))>mic_w/2+slot_l/2+1;
module top_vents() for(i=[0:slot_n-1]) if(top_slot_enabled(i)) hull(){
 translate([top_slot_x(i),top_slot_y+top_slot_front_h/2,-7])
 linear_extrude(0.02) centered_capsule(slot_l,top_slot_front_h);
 translate([top_slot_x(i),top_slot_y+0.05+top_slot_rear_h/2,22.1])
 linear_extrude(1.3) centered_capsule(slot_l,top_slot_rear_h);
}
module v5_insert() difference(){
 union(){
  difference(){v3_insert();electronics_bay();}
  rear_carrier_bosses();
  difference(){fan_plenum_solid();fan_plenum_air();}
  fan_mount_frame();
  control_tabs();
 }
 carrier_boss_cuts();
 for(p=carrier_screws) zhole(p[0],p[1],47.2,D-47.2+0.2,8.2);
 control_tab_cuts();
 fan_mount_cuts();
 // Radial allowance eliminates exact contact at the nominal rear socket.
 translate([gx(mnt[0]),gy(mnt[1]),PD-0.01]) cylinder(r=29.2,h=1.51);
 top_vents();
 // Route exhaust along the header, behind the separate microphone groove.
 rect3(30,94.7,20.7,104,1.4,2.7,0.4);
}
module v5_faceplate() difference(){
 v3_bezel();
 top_vents();
 translate([0,0,-flange_t-0.01]) linear_extrude(flange_t+0.1)
 offset(0.2) union(){
  control_tabs_2d();
  for(y=control_y) translate([0.99,y-4]) square([3.82,8]);
 }
}

module rear_carrier() difference(){
 union(){
  rect3(carrier_rect[0],carrier_rect[1],carrier_front,carrier_rect[2],carrier_rect[3],carrier_t,1);
  for(p=carrier_screws) zhole(p[0],p[1],47.2,D-47.2,7.6);
  for(x=[2.5,60.5],y=[2.5,54.5])
   zhole(fnk_origin[0]+x,fnk_origin[1]+y,carrier_front-fnk_post_h,fnk_post_h+0.01,6);
 }
 for(p=carrier_screws){
  zhole(p[0],p[1],47.1,D-47.1+0.1);
  zhole(p[0],p[1],49.1,1.9,4.4); // recessed head: max 1.7 mm height
 }
 fnk_holes(carrier_front-fnk_post_h-0.1,fnk_post_h+carrier_t+0.2);
 for(x=[2.5,60.5],y=[2.5,54.5])
  hexhole(fnk_origin[0]+x,fnk_origin[1]+y,D-1.8,2);
 // Existing provisional GPS cable clearance; add edge protection after fit.
 rect3(gx(usb[0])-15,gy(usb[1])-8,carrier_front-0.1,30,16,carrier_t+0.2,2);
 for(y=[13,25]) rect3(69+(y==25?0.3:0),y-2,carrier_front-0.1,2,4,carrier_t+0.2,0.3);
 // Two ties fasten the loose LED carrier; sensor/cable ties use the left pair.
 for(x=[96,114]) rect3(x,10,carrier_front-0.1,2,4,carrier_t+0.2);
}
module fnk_envelope(clear=0){
 translate([fnk_origin[0]-clear,fnk_origin[1]-clear,carrier_front-fnk_post_h-fnk_stack-clear])
 cube([fnk_size[0]+2*clear,fnk_size[1]+2*clear,fnk_stack+clear]);
}
module fan_envelope() translate([fan_xy[0]-20,fan_xy[1]-20,fan_front+0.01])
 cube([40,40,fan_pad_depth-0.01]);
module gps_rear_keepout(){
 translate([gx(mnt[0]),gy(mnt[1]),PD]) cylinder(r=29,h=1.5);
 translate([33,10,gps_t]) cube([33,17,18]); // TRIAL elbow volume, measure GPS/cable
}

// Side control pod: blank replaceable lid; select screen/switches before cutouts.
// It is entirely in front of the dash. Truck trim clearance remains untested.
module pod_mount_holes(z,h,d=2.2) for(x=[-38.5,-11.5],y=[8,90]) zhole(x,y,z,h,d);
module control_pod() difference(){
 union(){
  difference(){
   rect3(pod_x0,pod_y0,pod_front,pod_x1-pod_x0,pod_y1-pod_y0,pod_back-pod_front,1);
   rect3(pod_x0+2,pod_y0+2,pod_front-0.1,pod_x1-pod_x0-4,pod_y1-pod_y0-4,pod_back-pod_front-1.9,0.5);
  }
  for(x=[-38.5,-11.5],y=[8,90]) zhole(x,y,pod_front,pod_back-pod_front,6);
  for(y=control_y) rect3(-9,y-4,-6.6,8.6,8,2.4,1);
 }
 pod_mount_holes(pod_front-0.1,pod_back-pod_front+0.2);
 for(x=[-38.5,-11.5],y=[8,90]) hexhole(x,y,pod_back-1.8,2);
 for(y=control_y) zhole(-2.8,y,-7,4);
 // Wiring exits toward the cavity; no fixed connector footprint assumed.
 rect3(-31,7,-6.4,12,8,2.4,2);
}
module control_panel() difference(){
 rect3(pod_x0,pod_y0,pod_front-2,pod_x1-pod_x0,pod_y1-pod_y0,2,1);
 pod_mount_holes(pod_front-2.1,2.2);
}
module control_outline_test() difference(){
 union(){
  linear_extrude(2) difference(){
   translate([pod_x0,pod_y0]) rrect(34,90,1);
   translate([pod_x0+3,pod_y0+3]) rrect(28,84,1);
  }
  for(y=control_y) rect3(-9,y-4,0,8.6,8,2,1);
 }
 for(y=control_y) zhole(-2.8,y,-0.1,2.2);
}

// Two removable shelf modules. One reserves Zero 2 W board and connectors;
// the other has a universal tie grid for a FUTURE selected power circuit.
// Side inlet panel is blank: a raw USB-C socket is not a power supply.
function mod_w(kind)=kind=="zero"?zero_w:power_w;
function mod_x(kind)=kind=="zero"?ap3_x:pop3_x;
module mod_mounts(kind,z,h,d=2.2) for(x=[-mod_w(kind)/2+3,mod_w(kind)/2-3],y=[-18,18]) zhole(x,y,z,h,d);
module zero_board_holes(z,h,d=2.2) for(x=[-29,29],y=[-11.5,11.5]) zhole(x,y,z,h,d);
module module_body(kind) difference(){
 union(){
  difference(){
   rect3(-mod_w(kind)/2,-21,module_floor,mod_w(kind),42,module_lid-module_floor,1);
   rect3(-mod_w(kind)/2+2,-19,module_floor+2,mod_w(kind)-4,38,module_lid-module_floor,0.5);
  }
  for(x=[-mod_w(kind)/2+3,mod_w(kind)/2-3],y=[-18,18]) zhole(x,y,module_floor,module_lid-module_floor,5.6);
  if(kind=="zero") for(x=[-29,29],y=[-11.5,11.5]) zhole(x,y,7.99,3.01,5.2);
  if(kind=="power") for(x=[-17,17]) translate([x-3,-21,12]) cube([6,3.2,6]);
 }
 mod_mounts(kind,module_floor-0.1,module_lid-module_floor+0.2);
 if(kind=="zero"){
  zero_board_holes(5.9,5.3);
  for(x=[-29,29],y=[-11.5,11.5]) hexhole(x,y,5.9,1.9);
  // Full connector-side window and opposite cable/antenna opening.
  translate([-30,-22,9.5]) cube([60,5,12]);
  // microSD access, before closing cover or through end opening.
  translate([-mod_w(kind)/2-1,-10,9.5]) cube([5,20,11]);
 } else {
  translate([-14,-22,9]) cube([28,5,12]);
  for(x=[-17,17]){
   translate([x,-17,15]) rotate([90,0,0]) cylinder(d=2.2,h=8);
   translate([x,-17.8,15]) rotate([90,0,0]) rotate([0,0,30]) cylinder(r=4.3/sqrt(3),h=1.8,$fn=6);
  }
  for(x=[-20,-10,0,10,20],y=[-8,8]) rect3(x-1,y-2,5.9,2,4,2.2);
 }
}
module module_cover(kind) difference(){
 rect3(-mod_w(kind)/2,-21,module_lid,mod_w(kind),42,module_lid_t,1);
 mod_mounts(kind,module_lid-0.1,module_lid_t+0.2);
 for(x=[-22,-14,-6,2,10,18])
  translate([x,0,module_lid-0.1]) linear_extrude(module_lid_t+0.2) rotate(90) centered_capsule(16,3);
}
module power_inlet_panel() difference(){
 translate([-20,-23.4,7]) cube([40,2.4,16]);
 for(x=[-17,17]) translate([x,-20.9,15]) rotate([90,0,0]) cylinder(d=2.2,h=2.6);
}
module shelf_module(kind){
 at_item(mod_x(kind),module_s) {
  module_body(kind);
  module_cover(kind);
  if(kind=="power") power_inlet_panel();
 }
}
module v5_shelf() difference(){
 union(){
  tray_frame() translate([0,-tray_len/2,0]) cube([FW,tray_len,tray_t]);
  translate([0,-3,-rail_d]) cube([FW,rail_top+3,rail_d]);
  for(x0=tongue_x0) tongue_solid(x0);
  at_item(ap3_x,ap3_s) airpods_on_tray();
  for(kind=["zero","power"]) at_item(mod_x(kind),module_s) mod_mounts(kind,3.99,2.01,5.6);
 }
 for(i=[0,1]) tongue_cuts(tongue_x0[i],tongue_bx[i]);
 // Entire circular seat removes any unverified assumption about ring ID.
 at_item(pop3_x,pop3_s) zhole(0,0,-0.1,esr_recess_depth+0.1,esr_recess_d);
 for(kind=["zero","power"]) at_item(mod_x(kind),module_s){
  mod_mounts(kind,-0.1,6.2);
  for(x=[-mod_w(kind)/2+3,mod_w(kind)/2-3],y=[-18,18]) hexhole(x,y,-0.1,1.9);
 }
}
module zero_envelope(){
 // 65 x 30 PCB; upper box is a provisional component/header envelope.
 translate([-32.5,-15,11.01]) cube([65,30,10.5]);
}

// Follow-up coupons are intentionally small, labelled where useful.
module ring_depth_test(){
 depths=[0.4,0.6,0.8,1.0];
 for(i=[0:3]) translate([(i%2)*66,floor(i/2)*71,0]){
  difference(){
   rect3(0,0,0,62,66,2.4,2);
   zhole(31,31,2.4-depths[i],depths[i]+0.2,esr_recess_d);
   // Push-out hole avoids trapping an unglued sample in a shallow recess.
   zhole(31,31,-0.1,2.6,10);
  }
  translate([31,62,2.39]) linear_extrude(0.6) text(str(depths[i]),size=3,font="DejaVu Sans:style=Bold",halign="center",valign="center");
 }
}
module fan_mount_test() translate([-fan_xy[0]+23,-fan_xy[1]+23,-20.6]) difference(){
 union(){fan_mount_frame();rect3(fan_xy[0]-22,fan_xy[1]-22,20.6,44,44,1.41,1);}
 zhole(fan_xy[0],fan_xy[1],20.5,4,37);
 fan_mount_cuts();
}
module packing_test(){
 // Full XY outline plus PCB and fan depth towers; a dry-fit space gauge.
 union(){
  difference(){
   rect3(22.6,6.6,0,119.3,79.6,2,1);
   rect3(27.6,11.6,-0.1,109.3,69.6,2.2,1);
  }
  for(p=carrier_screws) difference(){zhole(p[0],p[1],0,2,7);zhole(p[0],p[1],-0.1,2.2);}
  // Thin frame models the 40 x 40 x 22 pad envelope at its actual offset.
  difference(){
   rect3(fan_xy[0]-20,fan_xy[1]-20,0,40,40,26.8,0.5);
   rect3(fan_xy[0]-18.4,fan_xy[1]-18.4,-0.1,36.8,36.8,27,0.5);
  }
  // Connect to reference frame without filling the fan volume.
  rect3(22.6,60,0,7,2,2);
  difference(){
   rect3(fnk_origin[0],fnk_origin[1],0,fnk_size[0],fnk_size[1],29.4,0.5);
   rect3(fnk_origin[0]+1.6,fnk_origin[1]+1.6,-0.1,fnk_size[0]-3.2,fnk_size[1]-3.2,29.6,0.5);
  }
  rect3(132,19,0,10,2,2);
 }
}
module assembly_v5(){
 color([0.42,0.46,0.50]) v5_insert();
 color([0.22,0.25,0.29]) v5_shelf();
 color([0.7,0.72,0.76]) v5_faceplate();
 color([0.6,0.64,0.67]) rear_carrier();
 color([0.6,0.36,0.17]) fan_envelope();
 color([0.12,0.5,0.26]) fnk_envelope();
 color([0.3,0.33,0.37]){control_pod();control_panel();}
 for(kind=["zero","power"]) color([0.3,0.33,0.37]) shelf_module(kind);
 gps_design();
 at_item(ap3_x,ap3_s) color([0.85,0.87,0.88]) airpods_standin_v4();
}

// Part exports are grounded on the bed; assemblies remain non-printing previews.
if(part=="insert_v5") translate([0,0,D]) to_physical() v5_insert();
if(part=="faceplate_v5") translate([0,0,flange_t+bezel_t]) v5_faceplate();
if(part=="shelf_v5") translate([0,0,-slope_top[0]+(tray_len+tray_t)*S2])
 multmatrix([[1,0,0,0],[0,0,1,0],[0,1,0,0],[0,0,0,1]]) v5_shelf();
if(part=="rear_carrier") translate([0,0,D]) to_physical() rear_carrier();
if(part=="control_pod") translate([0,0,pod_back]) to_physical() control_pod();
if(part=="control_panel") translate([0,0,-pod_front+2]) control_panel();
if(part=="control_outline_test") control_outline_test();
if(part=="zero_tray") translate([0,0,-module_floor]) module_body("zero");
if(part=="zero_cover") translate([0,0,-module_lid]) module_cover("zero");
if(part=="power_tray") translate([0,0,-module_floor]) module_body("power");
if(part=="power_cover") translate([0,0,-module_lid]) module_cover("power");
if(part=="power_inlet_panel") translate([0,-7,-21]) rotate([-90,0,0]) power_inlet_panel();
if(part=="ring_depth_test") ring_depth_test();
if(part=="fan_mount_test") fan_mount_test();
if(part=="packing_test") packing_test();
if(part=="side_gauge") side_gauge_v4();
if(part=="bolt_head_coupon") bolt_head_coupon_v4();
if(part=="airpods_charge_test") airpods_collar_local();
if(part=="nut_test") nut_coupon();
if(part=="bolt_cover_test") bolt_cover_coupon();
if(part=="led_carrier") led_carrier();
if(part=="assembly") translate([0,0,D]) to_physical() assembly_v5();

// Validation targets: stand-ins are dimensions, not manufacturer CAD models.
if(part=="check_fan_insert") intersection(){v5_insert();fan_envelope();}
if(part=="check_fnk_insert") intersection(){v5_insert();fnk_envelope();}
if(part=="check_fan_fnk") intersection(){fan_envelope();fnk_envelope();}
if(part=="check_rear_features") intersection(){v5_insert();gps_rear_keepout();}
if(part=="check_faceplate") intersection(){v5_insert();translate([0,0,-0.01]) v5_faceplate();}
if(part=="check_shelf") intersection(){v5_insert();translate([0,0,-0.01]) v5_shelf();}
if(part=="check_carrier") intersection(){v5_insert();translate([0,0,0.01]) rear_carrier();}
if(part=="check_control") intersection(){control_pod();v5_faceplate();}
if(part=="check_airpods") intersection(){v5_shelf();at_item(ap3_x,ap3_s) airpods_standin_v4();}
if(part=="check_charge") intersection(){
 union(){v5_shelf();shelf_module("zero");}
 at_item(ap3_x,ap3_s) translate([ap_charge_x,-ap_h/2-ap_floor_t-15,-ap_d/2-ap_charge_z])
 rotate([-90,0,0]) linear_extrude(20) offset(-0.2) charging_opening_2d();
}
if(part=="check_zero") intersection(){module_body("zero");zero_envelope();}
if(part=="check_module_shelf") intersection(){v5_shelf();
 for(kind=["zero","power"]) at_item(mod_x(kind),module_s) translate([0,0,0.01]) module_body(kind);
}
if(part=="check_module_lids") for(kind=["zero","power"]) intersection(){
 module_body(kind);translate([0,0,0.01]) module_cover(kind);
}

// Cropped fan plenum/header: same build direction as insert, to test bridges
// and support removal before a long print. Not a complete airflow fixture.
if(part=="fan_plenum_print_test") translate([0,0,24.4]) to_physical()
 intersection(){v5_insert();translate([23,38,19.1]) cube([118,60,5.3]);}
