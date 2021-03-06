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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          child,
        ],
      ),
      height: 800,
    );
  }
}
