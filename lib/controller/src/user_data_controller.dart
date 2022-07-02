import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techx/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';

UserModel defaultUserModel = UserModel(
  firstName: "TechX",
  lastName: "Member",
  email: "info@techx.com",
  expectedGraduationYear: 3055,
  howTheyHeardAboutUs: "Divine Guidance",
  joinIntent: "Conquer the club.",
  pid: "123456789",
  points: 276,
  memberProgressionIndex: 2,
  lastMembershipStatusUpdate: DateTime.now().toString(),
  attendance: [],
);

UserModel? cachedUserModel;
int dataExistenceErrorCounter = 0;
int dataGeneralErrorCounter = 0;

class UserDataController extends ChangeNotifier {
  UserModel userModel = defaultUserModel;
  bool signedIn = false;

  void setUserModelFromFirebase() async {
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);
    String uid;

    // Make sure that a user is signed in
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      uid = currentUser.uid;
    } else {
      throw Exception("No one signed in");
    }

    final userDataRef = FirebaseFirestore.instance.collection("users").doc(uid);
    userDataRef.get().then(
      (DocumentSnapshot doc) {
        if (doc.exists == true) {
          final data = doc.data() as Map<String, dynamic>;
          setUserModel(UserModel.fromData(data));
        } else {
          dataExistenceErrorCounter += 1;
          if (dataExistenceErrorCounter == 1) {
            throw Exception("Data not found. Try again.");
          } else {
            throw Exception("Contact the Board.");
          }
        }
      },
    ).catchError(
      (error) {
        dataGeneralErrorCounter += 1;
        if (dataGeneralErrorCounter == 1) {
          throw Exception("Can't get data. Try again");
        } else {
          throw Exception("Contact the Board.");
        }
      },
    );
  }

  void setUserModel(UserModel newUserModel) {
    userModel = newUserModel;
    cachedUserModel = newUserModel;
    notifyListeners();
  }

  UserModel get getUserModel {
    return cachedUserModel ?? userModel;
  }

  bool get isUserSignedIn {
    return true;
  }

  void setSignInStatus(bool status) {
    signedIn = status;
  }
}
