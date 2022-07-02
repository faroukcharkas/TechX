import 'package:flutter/material.dart';

class SimpleErrorWidget extends StatelessWidget {
  const SimpleErrorWidget({
    Key? key,
    this.message = "An error occurred.",
    this.secondaryMessage = "Let a Board Member know if problem persists.",
    this.showRed = false,
    this.icon = Icons.error_outline,
  }) : super(key: key);

  final String message;
  final String secondaryMessage;
  final bool showRed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Container()),
        Icon(
          icon,
          color: Colors.white,
          size: 40.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          secondaryMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: 15.0,
          ),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}
