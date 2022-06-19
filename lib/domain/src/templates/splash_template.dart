import 'package:flutter/material.dart';

class SplashScreenTemplate extends StatelessWidget {
  const SplashScreenTemplate({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
