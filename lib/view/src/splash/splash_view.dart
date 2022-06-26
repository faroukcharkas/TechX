import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'dart:async';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Make sure that the below duration is 2x the animation length.
    Timer(Duration(seconds: 6), () {
      Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
    });
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
