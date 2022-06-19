import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:techx/view/splash/splash_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return PageTransition(
        child: SplashScreen(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 500),
      );
    default:
      return null;
  }
}
