import 'dart:async';

import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  List<String> _welcomeMessages = [
    "Welcome.",
    "We're so excited you're here.",
    "We're a club for nerds, by nerds.",
    "Membership dues are 3 oz of blood sacrificed to Sitterson.",
    "Just kidding...",
    "We're doing cool beginner-friendly things.",
    "Make the most of it.",
    "",
  ];
  double _opacity = 0;
  int _index = 0;

  Future<void> _runMessageSequence() async {
    for (_index = 0; _index < _welcomeMessages.length - 1; _index++) {
      int timeToRead;
      int wordsInMessage = _welcomeMessages[_index].split(' ').length;
      if (wordsInMessage <= 1) {
        timeToRead = 1;
      } else {
        timeToRead = wordsInMessage % 4 + 1;
      }
      setState(() {
        _opacity = 1;
      });
      await Future.delayed(Duration(seconds: timeToRead));
      setState(() {
        _opacity = 0;
      });
      await Future.delayed(Duration(milliseconds: 750));
      setState(() {
        _opacity = 1;
      });
    }
    _welcomeIntoNextView();
  }

  void _welcomeIntoNextView() async {
    setState(() {
      _opacity = 0;
    });
    Future.delayed(Duration(milliseconds: 750));
    Navigator.pushNamedAndRemoveUntil(context, '/app', (route) => false);
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 0.2).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    _runMessageSequence();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TitledTemplate(
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.blue.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [animation.value, 1],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 750),
                child: Text(
                  _welcomeMessages[_index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    letterSpacing: -3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 70.0),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
