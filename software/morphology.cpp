



class Wheel {
  
};

class LowerLeg {
  float length = 25.0;
};

class UpperLeg {
  float length = 25.0;
};

class Hip {
  float width = 5.0;
};

class Leg {
  // 4 dof per leg
  Wheel wheel;
  LowerLeg lowerLeg;
  UpperLeg upperLeg;
  Hip hip;
};

class Shoulder {
  DOF inlineDof; // 25kg servo
  DOF perpendicularDof;  // 25kg servo
}

class UpperArm {
  DOF inlineDof; // mg996r
  DOF elbow; // 25kg servo
}

class LowerArm {
  // this is ulna/radius
  DOF inlineDof; // mg996r
  // a wrist is 2DOF
  // but this wrist is only 1 DOF
  DOF wrist; // mg996r
}

class Hand {
  DOF Pincer // mg996r
}


class Torso {
  Shoulder shoulder;
};
class Base {
  float height = 50;//cm
  Leg legs[4];
};

// 2sin(60deg)legLength=50
// solve for x and that is the leg height
// 50/(2sin(75deg)) = legLength

class Chiron {
  Torso torso;
  Base base;
  float weight = 6;
};
