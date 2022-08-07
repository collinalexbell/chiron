



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

class Torso {};
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
