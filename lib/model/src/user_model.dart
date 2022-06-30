import 'dart:core';

import 'package:techx/domain/domain.dart';

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
    required this.attendance,
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
  final List attendance;

  String get getFirstName {
    return firstName;
  }

  String get getLastName {
    return lastName;
  }

  String get getEmail {
    return email;
  }

  String get getGradYear {
    return getGradYear;
  }

  String get getHowHeard {
    return howTheyHeardAboutUs;
  }

  String get getJoinIntent {
    return joinIntent;
  }

  String get getPID {
    return pid;
  }

  int get getPoints {
    return points;
  }

  int get getMemberProgressIndex {
    return memberProgressionIndex;
  }

  DateTime get getLastMemberStatus {
    return DateTime.parse(lastMembershipStatusUpdate);
  }

  List get getAttendance {
    return attendance;
  }

  int get getRank {
    return RankUtility.getRank(points);
  }

  bool get getIsMember {
    return (memberProgressionIndex >= 2);
  }

  int getPointsTillNextRank(int rank) {
    return RankUtility.getPointsTillNextRank(rank, points);
  }

  bool get getHasPaid {
    return (memberProgressionIndex > -1);
  }
}
