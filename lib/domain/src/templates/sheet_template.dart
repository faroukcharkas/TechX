import 'package:flutter/material.dart';

class SheetTemplate extends StatelessWidget {
  const SheetTemplate({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Receipts",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.close,
                size: 25.0,
                color: Colors.white,
              ),
            ],
          ),
          child,
        ],
      ),
      height: 800,
    );
  }
}
