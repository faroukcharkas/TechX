import 'package:flutter/material.dart';

class NavigationTile extends StatelessWidget {
  const NavigationTile({
    Key? key,
    required this.color,
    required this.icon,
    required this.message,
    required this.onTap,
  }) : super(key: key);

  final MaterialColor color;
  final IconData icon;
  final String message;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.shade800,
              color.shade400,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.white, width: 0.25),
        ),
        height: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 60.0,
              color: Colors.white,
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              children: [
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.east,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
