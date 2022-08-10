// @kuberlog
// units are in CM
use <actuators/servo-35kg/servo-35kg.scad>
use <actuators/GearMotor1000RPM/GearMotor1000RPM.scad>
use <actuators/servo-25kg/servo-25kg.scad>
use <actuators/servo-mg996r/servo-mg996r.scad>


// left/right are from the perspective of the robot's daemon

module legs() {
  // back right
  translate([60, -200, -100]) rotate([0,0,90]) GearMotor1000RPM();
  translate([60, -200, 0]) rotate([0,0,-90]) Servo35kg(0);
  translate([60, -200, 100]) rotate([0,0,-90]) Servo35kg(0);
  translate([40, -200, 200]) Servo35kg(0);

  // back left
  translate([-60, -200, -100]) rotate([0,0,-90]) GearMotor1000RPM();
  translate([-60, -200, 0]) rotate([0,0,90]) Servo35kg(0);
  translate([-60, -200, 100]) rotate([0,0,90]) Servo35kg(0);
  translate([-40, -200, 200]) Servo35kg(0);

  // front left
  translate([-60, 0, -100]) rotate([0,0,-90]) GearMotor1000RPM();
  translate([-60, 0, 0]) rotate([0,0,90]) Servo35kg(0);
  translate([-60, 0, 100]) rotate([0,0,90]) Servo35kg(0);
  translate([-40, 0, 200]) Servo35kg(0);

  // front right
  translate([60, 0, -100]) rotate([0,0,90]) GearMotor1000RPM();
  translate([60, 0, 0]) rotate([0,0,-90]) Servo35kg(0);
  translate([60, 0, 100]) rotate([0,0,-90]) Servo35kg(0);
  translate([40, 0, 200]) Servo35kg(0);
}

module arms() {
  translate([0, 0, 500]) {
    // shoulder inlineDof
    translate([60,0,0]) rotate([0,0,-90]) Servo25kg(0);
    translate([-60,0,0]) rotate([0,0,90])Servo25kg(0);

    // shoulder perpendicularDof
    translate([80,15,0]) rotate([0,0,0]) Servo25kg(0);
    translate([-80,15,0]) rotate([0,0,0])Servo25kg(0);

    // biceps
    translate([90,50,-160]) rotate([0,0,90]) Servo25kg(0);
    translate([-90,50,-160]) rotate([0,0,-90])Servo25kg(0);

    // upper arm inlineDovf
    translate([90,35,-100]) rotate([-75,0,0]) ServoMG996r(0);
    translate([-90,35,-100]) rotate([-75,0,0]) ServoMG996r(0);

    // ulna/radius
    translate([90,150,-220]) rotate([-35,0,0]) ServoMG996r(0);
    translate([-90,150,-220]) rotate([-35,0,0]) ServoMG996r(0);

    // wrist
    translate([90,195,-260]) rotate([0,35,90]) ServoMG996r(0);
    translate([-90,185,-260]) rotate([0,-35,-90]) ServoMG996r(0);
  }
}

legs();
arms();
