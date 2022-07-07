import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techx/controller/controller.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/domain/src/widgets/dues_section.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.pid,
    required this.memberProgressionIndex,
    required this.rank,
    required this.pointsUntilNextRank,
    required this.duesAmount,
    required this.hasPaid,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  final String pid;
  final int memberProgressionIndex;
  final int rank;
  final int pointsUntilNextRank;
  final String duesAmount;
  final bool hasPaid;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ProfileHeader(firstName: firstName, lastName: lastName, pid: pid),
              SizedBox(
                height: 20.0,
              ),
              RankBadge(rank: rank, pointsUntilNextRank: pointsUntilNextRank),
              SizedBox(
                height: 20.0,
              ),
              PromoTrack(
                steps: ["Dues", "1-on-1", "Project"],
                index: memberProgressionIndex,
              ),
              SizedBox(
                height: 20.0,
              ),
              DuesSection(
                duesAmount: duesAmount,
                hasPaid: hasPaid,
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return PaySheet();
                    },
                  );
                },
              ),
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
                  FirebaseAuth.instance.signOut();
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                FirebaseAuth.instance.currentUser?.uid ?? "[no uid found]",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
