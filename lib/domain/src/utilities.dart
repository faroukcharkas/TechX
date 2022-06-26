import 'package:flutter/material.dart';

class RankUtility {
  static List<Color> getRankColors(int rank) {
    switch (rank) {
      case 0:
        return [
          Colors.black,
          Colors.black38,
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
}
