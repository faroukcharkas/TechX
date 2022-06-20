import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class SplashModel {
  final List _messagePool = [
    "The best CS club at UNC.",
    "Made for Nerds, by Nerds.",
    "What does the X even mean?",
    "Hi, Mom!",
    "Farouk Charkas is kinda cool...",
    "The X stands for Sleek and Cool.",
    "This is a sign to join The Board.",
    "Mac > PC",
  ];
  final _random = Random();

  String getRandomMessage() {
    return _messagePool[_random.nextInt(_messagePool.length)];
  }

  static proceedToNextScreenOnTimer(BuildContext context) {
    Timer(Duration(seconds: 6), () {
      Navigator.pushNamedAndRemoveUntil(context, '/app', (route) => false);
    });
  }
}
