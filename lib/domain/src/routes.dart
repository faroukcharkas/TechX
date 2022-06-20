import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:techx/view/view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return PageTransition(
        child: SplashView(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 500),
      );
    case '/app':
      return PageTransition(
        child: AppView(),
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 500),
      );
    default:
      return null;
  }
}
