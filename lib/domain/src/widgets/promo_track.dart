import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';

class PromoTrack extends StatelessWidget {
  const PromoTrack({
    Key? key,
    required this.index,
    required this.steps,
  }) : super(key: key);

  final int index;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Colors.white,
          width: 0.25,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You are currently a",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            RankUtility.getMembershipStatus(index >= steps.length - 1),
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          MemberProgress(
            index: index,
            steps: steps,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Dues must be paid annually in order for membership to persist. Membership expires August 1st, 2022.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
