import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:techx/domain/domain.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';

class PassView extends StatelessWidget {
  const PassView({
    Key? key,
    required this.rank,
    required this.pid,
    required this.lastName,
    required this.firstName,
    required this.memberProgressIndex,
  }) : super(key: key);

  final int rank;
  final String pid;
  final String lastName;
  final String firstName;
  final int memberProgressIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: MemberPass(
        rank: rank,
        pid: pid,
        lastName: lastName,
        firstName: firstName,
        memberProgressIndex: memberProgressIndex,
      ),
    );
  }
}
