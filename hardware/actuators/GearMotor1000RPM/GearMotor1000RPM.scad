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

shaft_delta_y = shaftNub_delta_y + shaft_y/2;

hole_pcd = 31;
hole_y = 1;
hole_d = 3;
num_holes = 6;

terminal_x = 3;
terminal_y = 6;
terminal_z = 0.5;
terminal_delta_y = -(gearbox_y + motor_y + terminal_y/2);
terminal_delta_z = 8;



module motor() {
  color([0.4,0.4,0.4]) {
    translate([0, motor_delta_y, 0]) {
      rotate([90,0,0]) cylinder(d=motor_d, h=motor_y,  center=true);
    }
  }
}

module gearbox() {
  difference() {
    color([0.3,0.3,0.3]) {
      translate([0, gearbox_delta_y, 0]) {
        rotate([90,0,0]) cylinder(d=gearbox_d, h=gearbox_y,  center=true);
      }
    }
    holes();
  }
}

module shaftNub() {
  color([0.6,0.6,0.6]) {
    translate([0, shaftNub_delta_y, shaftNub_delta_z]) {
      rotate([90,0,0]) cylinder(d=shaftNub_d, h=shaftNub_y,  center=true);
    }
  }
}

module shaft() {
  color([0.8, 0.8, 0.8]) {
    translate([0, shaft_delta_y, shaft_delta_z]) {
      rotate([90,0,0]) cylinder(d=shaft_d, h=shaft_y,  center=true);
    }
  }
}

module holes() {
  color([0/255, 180/255, 240/255]) {
    translate([0,0.01,0]) {
      rotate([90,0,0]) { 
        for(i = [0 : num_holes]) {
          rotate([0,0,360/num_holes * i]) translate([hole_pcd/2,0,0]) cylinder(d=hole_d, h=hole_y);
        }
      }
    }
  }
}

module terminal() {
  color([212/255, 189/255, 78/255]) translate([0 ,terminal_delta_y,0]) cube([terminal_x, terminal_y, terminal_z], center=true);
}

module terminals() {
  translate([0,0,terminal_delta_z]) terminal();
  translate([0,0,-terminal_delta_z]) terminal();
}

module GearMotor1000RPM() {
  motor();
  gearbox();
  shaftNub();
  shaft();
  terminals();
}

GearMotor1000RPM();
