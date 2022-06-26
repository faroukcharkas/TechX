import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';

class DuesSection extends StatelessWidget {
  const DuesSection({
    Key? key,
    required this.duesAmount,
    required this.hasPaid,
    required this.onTap,
  }) : super(key: key);

  final String duesAmount;
  final bool hasPaid;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Colors.white,
          width: 0.25,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TechX dues are",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "\$$duesAmount",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            children: [
              BasicButton(
                color: Colors.green,
                enabled: !hasPaid,
                enabledText: "Pay Dues",
                disabledText: "Already Paid",
                onTap: onTap,
              ),
            ],
          )
        ],
      ),
    );
  }
}
