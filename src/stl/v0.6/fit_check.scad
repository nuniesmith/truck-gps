// v0.6 FIT CHECKPOINT ONLY. No full enclosure/electronics mounting export.
// User caliper measurements confirmed 2026-09-27 America/New_York.
// Cubby: clear inside width 170, front height 98, height below rear notch 80.
// AirPods including Latercase: width 64, height 49, thickness 24.
// Dimensions in mm. Print at 100%. See README.md before using older parts.
part="front_frame";
$fn=64;
open_w=170;
open_h=98;
rear_h=80;
side_clear=0.3;
top_clear=0.4;
rear_clear=0.5;
front_w=open_w-2*side_clear;
front_h=open_h-top_clear;
rear_top=rear_h-rear_clear;
// These depths/tapers are inherited assumptions, NOT new caliper measurements.
cubby_d=50.8;
bar_depth=25.4;
bar_gap=1;
side_taper=4;
front_roof_drop=1;
floor_rise=0.5;
// Flat rear ceiling tests the reported 80 mm height; old +10 mm is removed.
gps_w=152.4;
gps_h=86.4;
gps_side_gap=0.7;
gps_corner=2;
chin=6.6;
pocket_w=gps_w+2*gps_side_gap;
pocket_h=gps_h+2*gps_side_gap;
pocket_x=(front_w-pocket_w)/2;
mic_x=pocket_x+gps_side_gap+100.4;
ap_w=64;
ap_h=49;
ap_d=24;
ap_clear=0.4;
ap_wall=2.5;
ap_floor=2.5;
ap_collar=12;
gauge_t=3;
assert(front_w+20<=220 && front_h+20<=220,"Bed footprint exceeded");
assert(chin+pocket_h<front_h,"GPS pocket exceeds frame");
assert(rear_top<front_h-front_roof_drop,"Notch must remain below front roof");
module rounded_rect(w,h,r){
 hull() for(x=[r,w-r],y=[r,h-r]) translate([x,y]) circle(r=r);
}
module capsule(w,h){
 hull() for(x=[-(w-h)/2,(w-h)/2]) translate([x,0]) circle(d=h);
}
module rim(t=6){difference(){children();offset(delta=-t) children();}}
module label(s,x,y){
 translate([x,y,gauge_t-0.01]) linear_extrude(0.61)
 text(s,size=3,font="DejaVu Sans:style=Bold",halign="center",valign="center");
}
module front_frame(){
 // Flat 4 mm slice checks the cubby opening and nominal GPS pocket only.
 // No faceplate tabs, bolt seats, top exhaust or actual GPS feature validation.
 linear_extrude(4) difference(){
  square([front_w,front_h]);
  translate([pocket_x,chin]) rounded_rect(pocket_w,pocket_h,gps_corner);
  translate([mic_x-4,chin+pocket_h-0.5]) square([8,front_h]);
  for(i=[0:12]) translate([front_w/2-48+i*8,3.4]) capsule(6,3.4);
 }
}
module side_gauge(){
 // Flat XY print: X is cubby depth, Y is height. FRONT is the X=0 edge.
 linear_extrude(gauge_t) rim() polygon([
  [0,0],[0,front_h],[bar_depth-bar_gap,front_h-front_roof_drop],
  [bar_depth-bar_gap,rear_top],[cubby_d,rear_top],[cubby_d,floor_rise]
 ]);
 label("F",3,front_h/2);
 label("V6",13,3);
 label("R",cubby_d-3,rear_top/2);
}
module plan_gauge(){
 linear_extrude(gauge_t) rim() polygon([
  [0,0],[front_w,0],[front_w-side_taper,cubby_d],[side_taper,cubby_d]
 ]);
 label("FRONT 170",front_w/2,3);
 label("V6 TAPER TEST",front_w/2,cubby_d-3);
}
module airpods_charge_test(){
 difference(){
  linear_extrude(ap_floor+ap_collar) offset(ap_wall)
   capsule(ap_w+2*ap_clear,ap_d+2*ap_clear);
  translate([0,0,ap_floor]) linear_extrude(ap_collar+0.1)
   capsule(ap_w+2*ap_clear,ap_d+2*ap_clear);
  // Existing provisional cable-body opening: 18 x 10, R2.
  translate([-9,-5,-0.1]) linear_extrude(ap_floor+0.2) rounded_rect(18,10,2);
 }
}
if(part=="front_frame") front_frame();
if(part=="side_gauge") side_gauge();
if(part=="plan_gauge") plan_gauge();
if(part=="airpods_charge_test") airpods_charge_test();
