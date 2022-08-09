// copyright: GNU @kuberlog
// https://www.amazon.com/4-Pack-MG996R-Torque-Digital-Helicopter/dp/B07MFK266B

$fn = 50;

body_x = 20;
body_y = 38.4;
body_z = 40.8;
body_delta_y = -body_y/2;

tab_x = 20;
tab_y = 2.5; // this dimension, we also do not know yet, measure
tab_z = 53.4;
tab_delta_y = -(9.2 + (tab_y/2));

body_delta_z = -(tab_z/2-16.6); // this dimension, we do not know yet, measure
tab_delta_z = body_delta_z;

hole_d = 4.4;
hole_h = tab_y + 2; //through-hole
hole_delta_y = tab_delta_y + 1; // through hole
hole_delta_x = 9.9/2;
hole_delta_z = 48.2/2;
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
  color([0.2,0.2,0.2]) translate([0, body_delta_y, body_delta_z]) cube([body_x, body_y, body_z], center=true);
}

module tab() {
  difference() {
    color([0.2, 0.2, 0.2]) translate([0, tab_delta_y, tab_delta_z]) cube([tab_x, tab_y, tab_z], center=true);
    holes();
  }
}

module hole() {
  rotate([90,0,0]) cylinder(d=hole_d, h=hole_h, center=true);
}

module holes() {
  color([114/255, 29/255, 138/255]) {
    translate([0,holes_deta_y,body_delta_z]) {
      translate([hole_delta_x, hole_delta_y, hole_delta_z]) hole();
      translate([-hole_delta_x, hole_delta_y, hole_delta_z]) hole();
      translate([hole_delta_x, hole_delta_y, -hole_delta_z]) hole();
      translate([-hole_delta_x, hole_delta_y, -hole_delta_z]) hole();
    }
  }
}

module horn() {
  color([114/255, 29/255, 138/255]) {
    translate([0,horn_delta_y,0]) {
      rotate([90, 0, 0]) cylinder(d=horn_base_d, h=horn_y, center=true);
      translate([0,0,horn_extension_delta_z]) cube([horn_extension_x, horn_y, horn_extension_z], center=true);
      translate([0,0,horn_tip_delta_z]) rotate([90,0,0]) cylinder(d=horn_tip_d, h = horn_y, center=true);
      
    }
  }
}

module ServoMG996r(x) {
  body();
  tab();
  rotate([0,x,0]) horn();
}

ServoMG996r(0);
