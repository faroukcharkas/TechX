import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techx/controller/controller.dart';
import 'package:techx/domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  void requestPermissions() async {
    final bool? result = await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    DateTime animationBeginTime = DateTime.now();
    DateTime animationEndTime = animationBeginTime.add(Duration(seconds: 6));
    // Make sure that the below duration is 2x the animation length.
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // User is not signed in.
        Timer(
          const Duration(seconds: 6),
          () {
            if (mounted) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/auth', (route) => false);
            }
          },
        );
      } else {
        // User is signed in.
        try {
          Provider.of<UserDataController>(context, listen: false)
              .setUserModelFromFirebase();
        } catch (e) {
          print(e.toString());
          // Silent errors.
        }
        Timer(
          const Duration(seconds: 6),
          () {
            if (mounted) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/app', (route) => false);
            }
          },
        );
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenTemplate(
      image: Image.asset(
        'assets/brand/techx-full-logo@0.5x/techx-full-logo@0.5x(white).png',
        scale: 2.5,
      ),
    );
  }
}
