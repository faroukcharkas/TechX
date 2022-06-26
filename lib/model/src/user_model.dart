class UserModel {
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.expectedGraduationYear,
    required this.howTheyHeardAboutUs,
    required this.joinIntent,
    required this.pid,
    required this.points,
    required this.memberProgressionIndex,
    required this.lastMembershipStatusUpdate,
    required this.jsonAttendance,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String expectedGraduationYear;
  final String howTheyHeardAboutUs;
  final String joinIntent;
  final String pid;
  final int points;
  final int memberProgressionIndex;
  final String lastMembershipStatusUpdate;
  final String jsonAttendance;
}
