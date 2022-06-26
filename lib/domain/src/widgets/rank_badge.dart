import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';

class RankBadge extends StatelessWidget {
  const RankBadge({
    Key? key,
    required this.rank,
    required this.pointsUntilNextRank,
  }) : super(key: key);

  final int rank;
  final int pointsUntilNextRank;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.white,
          width: 0.25,
        ),
        gradient: LinearGradient(
          colors: RankUtility.getRankColors(rank),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                RankUtility.getRankName(rank),
                style: TextStyle(
                  color: Colors.black.withOpacity(0.75),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Competition Rank",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.75),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Icon(
            Icons.star,
            size: 16,
            color: Colors.black.withOpacity(0.75),
          ),
          Text(
            pointsUntilNextRank.toString(),
            style: TextStyle(
              color: Colors.black.withOpacity(0.75),
              fontSize: 16.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            "until ${RankUtility.getRankName(rank + 1)}",
            style: TextStyle(
              color: Colors.black.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}
