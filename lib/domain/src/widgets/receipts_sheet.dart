import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';

class ReceiptsSheet extends StatelessWidget {
  const ReceiptsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SheetTemplate(
      title: "Receipts",
      child: Container(
        height: 300,
        width: double.infinity,
        child: Text("Hello"),
      ),
    );
  }
}
