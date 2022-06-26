import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({
    Key? key,
    required this.rank,
    required this.isMember,
    required this.lastStatusUpdate,
  }) : super(key: key);

  final int rank;
  final bool isMember;
  final DateTime lastStatusUpdate;

  List<Widget> _getRankRate() {
    Color stepColor;

    if (rank == 0) {
      stepColor = Colors.white;
    } else {
      stepColor = Colors.black.withOpacity(0.5);
    }

    List<Widget> returnRankList = [];
    for (var i = 0; i < (4 - rank); i++) {
      returnRankList.add(
        Icon(
          Icons.rectangle_outlined,
          color: stepColor,
        ),
      );
    }
    for (var i = 0; i < rank; i++) {
      returnRankList.add(
        Icon(
          Icons.rectangle,
          color: stepColor,
        ),
      );
    }
    return returnRankList;
  }

  String _getRankName() {
    if (rank == 0) {
      return "Associate";
    } else {
      return "Member";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(1.0),
      height: 175.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.white,
          width: 0.25,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _getRankRate(),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13.0),
                bottomLeft: Radius.circular(13.0),
              ),
              gradient: LinearGradient(
                colors: RankUtility.getRankColors(rank),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: double.infinity,
            width: 0.25,
          ),
          SizedBox(
            width: 10.0,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You are currently a",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  RankUtility.getMembershipStatus(isMember),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  "Since ${lastStatusUpdate.month}/${lastStatusUpdate.day}/${lastStatusUpdate.year}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
