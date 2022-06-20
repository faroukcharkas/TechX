import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';

class PassView extends StatelessWidget {
  const PassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: Colors.brown.shade900,
            width: 15.0,
          ),
          gradient: LinearGradient(
            colors: [
              Colors.brown.shade400,
              Colors.brown.shade800,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
