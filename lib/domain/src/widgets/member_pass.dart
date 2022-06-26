import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:techx/domain/domain.dart';

class MemberPass extends StatefulWidget {
  const MemberPass({
    Key? key,
    required this.rank,
    required this.pid,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  final int rank;
  final String pid;
  final String lastName;
  final String firstName;

  @override
  State<MemberPass> createState() => _MemberPassState();
}

class _MemberPassState extends State<MemberPass>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  bool gradientToggle = true;

  @override
  void dispose() {
    controller.dispose();
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          colors: RankUtility.getRankColors(widget.rank),
          begin: gradientToggle ? Alignment.topLeft : Alignment.topRight,
          end: gradientToggle ? Alignment.bottomRight : Alignment.bottomLeft,
          stops: [0, animation.value],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BarcodeWidget(
              height: 50.0,
              color: Colors.black.withOpacity(0.5),
              data: widget.pid,
              barcode: Barcode.pdf417(),
              drawText: false,
            ),
            Row(
              children: [
                Text(
                  widget.pid,
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
              "${widget.lastName},",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              widget.firstName,
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
