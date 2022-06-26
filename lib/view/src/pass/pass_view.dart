import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:techx/domain/domain.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';

class PassView extends StatelessWidget {
  const PassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: MemberPass(
        rank: 4,
        pid: "730481745",
        lastName: "Charkas",
        firstName: "Farouk",
      ),
    );
  }
}
