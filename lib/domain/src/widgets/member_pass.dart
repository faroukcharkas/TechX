import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';

class MemberPass extends StatelessWidget {
  const MemberPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BarcodeWidget(
            height: 50.0,
            color: Colors.black.withOpacity(0.5),
            data: "TechX Rules",
            barcode: Barcode.pdf417(),
            drawText: false,
          ),
          Row(
            children: [
              Text(
                "730481745",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Expanded(child: Container()),
              Text(
                "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().hour}/${DateTime.now().minute}",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            "Charkas,",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Farouk",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          QrImage(
            data: "1234567890",
            version: QrVersions.auto,
            size: 300.0,
          ),
          Row(
            children: [
              Image.asset(
                'assets/brand/techx-full-logo@0.5x/techx-full-logo@0.5x(black).png',
                scale: 5,
                color: Colors.black.withOpacity(0.5),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                height: 30.0,
                width: 50.0,
                child: LoadingIndicator(
                  indicatorType: Indicator.lineScale,
                  strokeWidth: 2.0,
                  colors: [Colors.black.withOpacity(0.5)],
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color: Colors.brown.shade900,
          width: 15.0,
        ),
        gradient: LinearGradient(
          colors: [
            Colors.brown.shade400,
            Colors.brown.shade800,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
