import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techx/model/model.dart';
import 'package:vibration/vibration.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

class NotificationUtility {
  static Future<String> _getTimeZoneName() async {
    return await FlutterNativeTimezone.getLocalTimezone();
  }

  static Future<tz.Location> _getLocation() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));

    return tz.getLocation(timeZoneName);
  }

  static void scheduleNotification(
      int id, String title, String body, DateTime time) async {
    var location = await _getLocation();

    FlutterLocalNotificationsPlugin().zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(time, location),
      NotificationDetails(
        android: AndroidNotificationDetails(id.toString(), 'EVENTS'),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  static void scheduleFromEventList(List<EventModel> eventList) async {
    List<EventModel> reversedEventList = List.from(eventList.reversed);
    for (var i = 0; i < reversedEventList.length; i++) {
      if (reversedEventList[i]
          .beginTime
          .subtract(Duration(hours: 1))
          .isAfter(DateTime.now())) {
        scheduleNotification(
          i,
          "${reversedEventList[i].title} starting in 1 hour",
          "${reversedEventList[i].location} @ ${reversedEventList[i].intraDayTime}",
          reversedEventList[i].beginTime.subtract(Duration(hours: 1)),
        );
      }
      if (reversedEventList[i]
          .beginTime
          .subtract(Duration(hours: 6))
          .isAfter(DateTime.now())) {
        scheduleNotification(
          i,
          "${reversedEventList[i].title} starting in 6 hours",
          "${reversedEventList[i].location} @ ${reversedEventList[i].intraDayTime}",
          reversedEventList[i].beginTime.subtract(Duration(hours: 6)),
        );
      }
      if (i == 65) {
        break;
      }
    }
  }
}
