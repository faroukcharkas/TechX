import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/domain/src/templates/splash_template.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenTemplate(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            "This is a blank screen.",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
