import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SimpleLoadingWidget extends StatelessWidget {
  const SimpleLoadingWidget({
    Key? key,
    this.message = "Loading...",
    this.secondaryMessage = "Taking too long? Let a Board Member know.",
    this.showRed = false,
    this.loadingIndicator = Indicator.pacman,
  }) : super(key: key);

  final String message;
  final String secondaryMessage;
  final bool showRed;
  final Indicator loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Container()),
        Container(
          child: LoadingIndicator(
            indicatorType: loadingIndicator,
            colors: [Colors.white],
          ),
          height: 90.0,
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
