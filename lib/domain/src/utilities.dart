import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

const rankPoints = [100, 200, 300, 400, 500, 600, 700, 800, 900];

class RankUtility {
  static List<Color> getRankColors(int rank) {
    switch (rank) {
      case 0:
        return [
          Colors.black,
          Colors.grey.shade800,
        ];
      case 1:
        return [
          Colors.brown.shade500,
          Colors.brown.shade800,
        ];
      case 2:
        return [
          Colors.grey.shade400,
          Colors.grey.shade800,
        ];
      case 3:
        return [
          Colors.yellow.shade400,
          Colors.yellow.shade800,
        ];
      case 4:
        return [
          Colors.cyan.shade400,
          Colors.cyan.shade800,
        ];
      default:
        return [
          Colors.blue,
          Colors.black,
        ];
    }
  }

  static int getRank(int points) {
    for (var i = 0; i < rankPoints.length; i++) {
      if (points < rankPoints[i]) {
        return i;
      }
    }
    return 5;
  }

  static String getRankName(int rank) {
    switch (rank) {
      case 0:
        return "Untested";
      case 1:
        return "Bronze";
      case 2:
        return "Silver";
      case 3:
        return "Gold";
      case 4:
        return "Diamond";
      case 5:
        return "TechX King";
      default:
        return "Member";
    }
  }

  static String getMembershipStatus(bool isMember) {
    if (isMember) {
      return "Member";
    } else {
      return "Associate";
    }
  }

  static int getPointsTillNextRank(int rank, int points) {
    return ((rank == 0) ? 1 : rankPoints[rank + 1] - points);
  }
}

class AuthUtility {
  static void setAuthListener(
      void Function(User) signedIn, void Function() signedOut) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        signedOut();
      } else {
        signedIn(user);
      }
    });
  }
}

class VibrateUtility {
  static void vibrate() async {
    if (await Vibration.hasVibrator() ?? true) {
      Vibration.vibrate();
    }
  }
}
