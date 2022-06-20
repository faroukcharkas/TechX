import 'package:flutter/material.dart';

class FullTemplate extends StatelessWidget {
  const FullTemplate({
    Key? key,
    required this.navBarIndex,
    required this.body,
    required this.onTap,
  }) : super(key: key);

  final int navBarIndex;
  final Widget body;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/brand/techx-full-logo@0.5x/techx-full-logo@0.5x(white).png',
              scale: 6,
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              children: [
                Icon(Icons.star),
                SizedBox(width: 3.0),
                Text("145"),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: body,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 0.25,
            ),
          ),
        ),
        child: BottomNavigationBar(
          onTap: onTap,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedItemColor: Colors.white,
          currentIndex: navBarIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: "Your Pass",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_outlined),
              label: "Events",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
