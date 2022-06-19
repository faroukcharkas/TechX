import 'package:techx/view/splash/splash_screen.dart';

import 'domain/domain.dart';
import 'package:flutter/material.dart';

class TechX extends StatelessWidget {
  const TechX({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: kThemeData,
      home: SplashScreen(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
