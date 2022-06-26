import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/domain/src/widgets/dues_section.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ProfileHeader(
                  firstName: "Farouk", lastName: "Charkas", pid: "730481745"),
              SizedBox(
                height: 20.0,
              ),
              RankBadge(rank: 3, pointsUntilNextRank: 10),
              SizedBox(
                height: 20.0,
              ),
              PromoTrack(steps: ["Dues", "1-on-1", "Project"], index: 0),
              SizedBox(
                height: 20.0,
              ),
              DuesSection(duesAmount: "25", hasPaid: true, onTap: () {}),
              SizedBox(
                height: 20.0,
              ),
              BasicButton(
                minWidth: double.infinity,
                color: Colors.red,
                enabled: true,
                filledIn: false,
                enabledText: "Log Out",
                disabledText: "Show Receipts",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
