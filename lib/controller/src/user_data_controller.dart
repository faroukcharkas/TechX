import 'package:flutter/material.dart';
import 'package:techx/model/model.dart';

UserModel defaultUserModel = UserModel(
  firstName: "TechX",
  lastName: "Member",
  email: "info@techx.com",
  expectedGraduationYear: "3055",
  howTheyHeardAboutUs: "Divine Guidance",
  joinIntent: "Conquer the club.",
  pid: "123456789",
  points: 276,
  memberProgressionIndex: 2,
  lastMembershipStatusUpdate: DateTime.now().toString(),
  attendance: [],
);

class UserDataController extends ChangeNotifier {
  UserModel userModel = defaultUserModel;

  void setUserModel(UserModel newUserModel) {
    userModel = newUserModel;
    notifyListeners();
  }

  UserModel get getUserModel {
    return userModel;
  }
}
