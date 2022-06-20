import 'domain/domain.dart';
import 'package:flutter/material.dart';
import 'view/view.dart';

class TechX extends StatelessWidget {
  const TechX({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechX',
      debugShowCheckedModeBanner: false,
      theme: kThemeData,
      home: SplashView(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
