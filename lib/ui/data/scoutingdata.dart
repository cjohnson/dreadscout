class ScoutingData {
  int autonLowGoal = 0;
  int autonHighGoal = 0;
  bool autonTaxi = false;
  int teleopLowGoal = 0;
  int teleopHighGoal = 0;
  bool effectiveDefense = false;
  ClimbLevel climb = ClimbLevel.NONE;
  String comments = "";

  Map<String, dynamic> toJson() => {
    'autonLowGoal': autonLowGoal,
    'autonHighGoal': autonHighGoal,
    'autonTaxi': autonTaxi,
    'teleopLowGoal': teleopLowGoal,
    'teleopHighGoal': teleopHighGoal,
    'effectiveDefense': effectiveDefense,
    'climb': climb,
    'comments': comments,
  };
}

enum ClimbLevel {
  NONE,
  LOW,
  MEDIUM,
  HIGH,
  TRAVERSAL
}