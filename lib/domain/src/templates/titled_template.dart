import 'package:flutter/material.dart';

class TitledTemplate extends StatelessWidget {
  const TitledTemplate({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/brand/techx-full-logo@0.5x/techx-full-logo@0.5x(white).png',
              scale: 6,
              color: Colors.white.withOpacity(0.7),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: body,
    );
  }
}
