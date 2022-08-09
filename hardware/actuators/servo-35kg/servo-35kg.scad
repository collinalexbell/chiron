// copyright: GNU @kuberlog
// https://www.amazon.com/gp/product/B08739MGPL

$fn = 50;

body_x = 20;
body_y = 43;
body_z = 40;
body_delta_y = -body_y/2;
body_delta_z = -9.86; // this dimension, we do not know yet, measure

tab_x = 19;
tab_y = 2.5; // this dimension, we also do not know yet, measure
tab_z = 55;
tab_delta_y = -(body_y - 32 - (tab_y/2));
tab_delta_z = body_delta_z;

hole_d = 4.5;
hole_h = tab_y + 2; //through-hole
hole_delta_y = tab_delta_y + 1;
hole_delta_x = 5;
hole_delta_z = 48/2;
holes_delta_z = body_delta_z;
holes_deta_y = -tab_y/2;

horn_y = 6;
horn_delta_y = horn_y/2;
horn_base_d = 12;
horn_extension_z = 24;
horn_tip_d = 8;
horn_extension_x = horn_tip_d;
horn_extension_delta_z = horn_extension_z/2;
horn_tip_delta_z = horn_extension_z;


module body() {
  color([0.1,0.1,0.1]) translate([0, body_delta_y, body_delta_z]) cube([body_x, body_y, body_z], center=true);
}

module tab() {
  difference() {
    color([0.1, 0.1, 0.1]) translate([0, tab_delta_y, tab_delta_z]) cube([tab_x, tab_y, tab_z], center=true);
    holes();
  }
}

module hole() {
  rotate([90,0,0]) cylinder(d=hole_d, h=hole_h, center=true);
}

module holes() {
  color([7/255, 133/255, 230/255]) {
    translate([0,holes_deta_y,body_delta_z]) {
      translate([hole_delta_x, hole_delta_y, hole_delta_z]) hole();
      translate([-hole_delta_x, hole_delta_y, hole_delta_z]) hole();
      translate([hole_delta_x, hole_delta_y, -hole_delta_z]) hole();
      translate([-hole_delta_x, hole_delta_y, -hole_delta_z]) hole();
    }
  }
}

module horn() {
  color([7/255, 133/255, 230/255]) {
    translate([0,horn_delta_y,0]) {
      rotate([90, 0, 0]) cylinder(d=horn_base_d, h=horn_y, center=true);
      translate([0,0,horn_extension_delta_z]) cube([horn_extension_x, horn_y, horn_extension_z], center=true);
      translate([0,0,horn_tip_delta_z]) rotate([90,0,0]) cylinder(d=horn_tip_d, h = horn_y, center=true);
      
    }
  }
}

module Servo25kg(x) {
  body();
  tab();
  rotate([0,x,0]) horn();
}

Servo25kg(/*$t*180*//*animation*/    0/*not animation*/);
