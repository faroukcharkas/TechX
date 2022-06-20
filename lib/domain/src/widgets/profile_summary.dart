import 'package:flutter/material.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({
    Key? key,
    required this.rank,
    required this.memberSince,
  }) : super(key: key);

  final int rank;
  final DateTime memberSince;

  MaterialColor _getRankColor() {
    switch (rank) {
      case 1:
        return Colors.brown;
      case 2:
        return Colors.grey;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.cyan;
      default:
        return Colors.brown;
    }
  }

  List<Widget> _getRankRate() {
    List<Widget> returnRankList = [];
    for (var i = 0; i < (4 - rank); i++) {
      returnRankList.add(
        Icon(
          Icons.rectangle_outlined,
          color: Colors.black.withOpacity(0.5),
        ),
      );
    }
    for (var i = 0; i < rank; i++) {
      returnRankList.add(
        Icon(
          Icons.rectangle,
          color: Colors.black.withOpacity(0.5),
        ),
      );
    }
    return returnRankList;
  }

  String _getRankName() {
    if (rank > 0) {
      return "Member";
    } else {
      return "Associate";
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
                colors: [
                  _getRankColor().shade300,
                  _getRankColor().shade700,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
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
                  _getRankName(),
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
                  "Since ${memberSince.month}/${memberSince.day}/${memberSince.year}",
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
