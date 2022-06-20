import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      color: Colors.black,
      child: Column(
        children: [
          ProfileSummary(
            rank: 1,
            memberSince: DateTime.now(),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              NavigationTile(
                color: Colors.blue,
                icon: Icons.qr_code,
                message: "Open Pass",
              ),
              SizedBox(
                width: 20.0,
              ),
              NavigationTile(
                color: Colors.blueGrey,
                icon: Icons.person,
                message: "Open Profile",
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          NavigationTile(
            color: Colors.deepPurple,
            icon: Icons.event_outlined,
            message: "Open Event Schedule",
          ),
        ],
      ),
    );
  }
}
