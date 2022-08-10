// @kuberlog
// units are in CM
use <actuators/servo-35kg/servo-35kg.scad>
use <actuators/GearMotor1000RPM/GearMotor1000RPM.scad>

// left/right are from the perspective of the robot's daemon

// back right
translate([60, 0, -100]) rotate([0,0,90]) GearMotor1000RPM();
translate([60, 0, 0]) rotate([0,0,-90]) Servo35kg(0);
translate([60, 0, 100]) rotate([0,0,-90]) Servo35kg(0);
translate([40, 0, 200]) Servo35kg(0);

// back left
translate([-60, 0, -100]) rotate([0,0,-90]) GearMotor1000RPM();
translate([-60, 0, 0]) rotate([0,0,90]) Servo35kg(0);
translate([-60, 0, 100]) rotate([0,0,90]) Servo35kg(0);
translate([-40, 0, 200]) Servo35kg(0);

// front left
translate([-60, 200, -100]) rotate([0,0,-90]) GearMotor1000RPM();
translate([-60, 200, 0]) rotate([0,0,90]) Servo35kg(0);
translate([-60, 200, 100]) rotate([0,0,90]) Servo35kg(0);
translate([-40, 200, 200]) Servo35kg(0);

// front right
translate([60, 200, -100]) rotate([0,0,90]) GearMotor1000RPM();
translate([60, 200, 0]) rotate([0,0,-90]) Servo35kg(0);
translate([60, 200, 100]) rotate([0,0,-90]) Servo35kg(0);
translate([40, 200, 200]) Servo35kg(0);
