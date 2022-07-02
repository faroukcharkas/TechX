import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/model/model.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    required this.pageController,
    required this.rank,
    required this.isMember,
    required this.lastStatusUpdate,
  }) : super(key: key);

  final PageController pageController;
  final int rank;
  final bool isMember;
  final DateTime lastStatusUpdate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileSummary(
                rank: rank,
                isMember: isMember,
                lastStatusUpdate: lastStatusUpdate,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: NavigationTile(
                      color: Colors.blue,
                      icon: Icons.qr_code_2_outlined,
                      message: "Open Pass",
                      onTap: () {
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: NavigationTile(
                      color: Colors.blueGrey,
                      icon: Icons.person_outline,
                      message: "Open Profile",
                      onTap: () {
                        pageController.animateToPage(3,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                    ),
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
                onTap: () {
                  pageController.animateToPage(2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
