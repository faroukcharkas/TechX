import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:techx/domain/domain.dart';
import 'dart:math';

class MemberPass extends StatefulWidget {
  const MemberPass({
    Key? key,
    required this.rank,
    required this.pid,
    required this.firstName,
    required this.lastName,
    required this.memberProgressIndex,
  }) : super(key: key);

  final int rank;
  final String pid;
  final String lastName;
  final String firstName;
  final int memberProgressIndex;

  @override
  State<MemberPass> createState() => _MemberPassState();
}

class _MemberPassState extends State<MemberPass>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  bool gradientToggle = true;
  late String qrcodeCode;
  late Timer resetTimer;

  void generateCode(String pid) {
    setState(() {
      qrcodeCode = "PID=${pid}+TIME=${DateTime.now().toString()}";
    });
  }

  @override
  void dispose() {
    controller.dispose();
    resetTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (mounted) {
            setState(() {
              gradientToggle = !gradientToggle;
            });
          }
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          if (mounted) {
            setState(() {
              gradientToggle = !gradientToggle;
            });
          }
          controller.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    controller.forward();

    // Start QR code switcher
    generateCode(widget.pid);
    resetTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (mounted) {
        generateCode(widget.pid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = (widget.rank == 0 ? Colors.white : Colors.black);

    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: textColor,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(45.0),
        gradient: LinearGradient(
          colors: RankUtility.getRankColors(widget.rank),
          begin: gradientToggle ? Alignment.topLeft : Alignment.topRight,
          end: gradientToggle ? Alignment.bottomRight : Alignment.bottomLeft,
          stops: [0, animation.value],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: (() {
          if (widget.memberProgressIndex >= 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BarcodeWidget(
                  height: 50.0,
                  color: textColor.withOpacity(0.5),
                  data: (() {
                    return "69420";
                  })(),
                  barcode: Barcode.codabar(),
                  drawText: false,
                ),
                Row(
                  children: [
                    Text(
                      widget.pid,
                      style: TextStyle(
                        color: textColor.withOpacity(0.5),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().hour}/${DateTime.now().minute}",
                      style: TextStyle(
                        color: textColor.withOpacity(0.5),
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
                  "${widget.lastName},",
                  style: TextStyle(
                    color: textColor.withOpacity(0.8),
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.firstName,
                  style: TextStyle(
                    color: textColor.withOpacity(0.8),
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                QrImage(
                  data: qrcodeCode,
                  version: QrVersions.auto,
                  size: 300.0,
                  foregroundColor: textColor,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/brand/techx-full-logo@0.5x/techx-full-logo@0.5x(black).png',
                      scale: 5,
                      color: textColor.withOpacity(0.5),
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
                        colors: [textColor.withOpacity(0.5)],
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Expanded(child: Container()),
                Icon(
                  Icons.block,
                  color: Colors.white,
                  size: 80.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Member pass will display when you have paid your dues and have became an Associate.",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: Container()),
              ],
            );
          }
        })(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: textColor,
            width: 0.5,
          ),
          gradient: SweepGradient(
            colors: RankUtility.getRankColors(widget.rank),
            center: Alignment.bottomRight,
            stops: [animation.value, 1],
          ),
        ),
      ),
    );
  }
}
