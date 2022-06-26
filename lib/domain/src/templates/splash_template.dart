import 'package:flutter/material.dart';

class SplashScreenTemplate extends StatefulWidget {
  const SplashScreenTemplate({
    Key? key,
    required this.image,
    this.message,
  }) : super(key: key);

  final Image image;
  final String? message;

  @override
  State<SplashScreenTemplate> createState() => _SplashScreenTemplateState();
}

class _SplashScreenTemplateState extends State<SplashScreenTemplate>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0.9, end: 0.6)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease))
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
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(70.0),
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: SweepGradient(
          center: Alignment.bottomRight,
          tileMode: TileMode.mirror,
          colors: [
            Colors.black,
            Colors.blue,
          ],
          stops: [animation.value, 1],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          widget.image,
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
