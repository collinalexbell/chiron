// copyright: GNU @kuberlog
// https://www.amazon.com/gp/product/B0745YDSJS

$fn = 50;

gearbox_d = 37;
gearbox_y = 23;
gearbox_delta_y = -gearbox_y/2;

motor_d = 36.2;
motor_y = 33.3;
motor_delta_y = -motor_y/2 - gearbox_y;

shaft_d = 6;
shaft_y = 14;
shaft_delta_z = 7;

shaftNub_d = 12;
shaftNub_y = 5;
shaftNub_delta_y = shaftNub_y/2;
shaftNub_delta_z = shaft_delta_z;



module motor() {
  color([0.4,0.4,0.4]) {
    translate([0, motor_delta_y, 0]) {
      rotate([90,0,0]) cylinder(d=motor_d, h=motor_y,  center=true);
    }
  }
}

module gearbox() {
  color([0.3,0.3,0.3]) {
    translate([0, gearbox_delta_y, 0]) {
      rotate([90,0,0]) cylinder(d=gearbox_d, h=gearbox_y,  center=true);
    }
  }
}

module shaftNub() {
  color([0.6,0.6,0.6]) {
    translate([0, shaftNub_delta_y, shaftNub_delta_z]) {
      rotate([90,0,0]) cylinder(d=shaftNub_d, h=shaftNub_y,  center=true);
    }
  }
}

module GearMotor1000RPM() {
  motor();
  gearbox();
  shaftNub();
}

GearMotor1000RPM();
