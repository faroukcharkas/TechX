import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.pid,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  final String pid;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  List<Map<String, dynamic>> _colorList = [
    {
      "color": Colors.blue,
      "text": Colors.black,
    },
    {
      "color": Colors.red,
      "text": Colors.white,
    },
    {
      "color": Colors.yellow,
      "text": Colors.black,
    },
    {
      "color": Colors.purple,
      "text": Colors.white,
    },
    {
      "color": Colors.green,
      "text": Colors.black,
    },
    {
      "color": Colors.indigo,
      "text": Colors.white,
    },
    {
      "color": Colors.pink,
      "text": Colors.black,
    },
    {
      "color": Colors.orange,
      "text": Colors.black,
    }
  ];
  int index = 0;

  void _changeColor() {
    setState(() {
      index += 1;
      if (index >= _colorList.length) {
        index = 0;
      }
    });
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _changeColor();
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _changeColor();
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
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(),
          ),
          AnimatedContainer(
            height: 60,
            width: 60,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: _colorList[index]["color"],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                widget.firstName[0] + widget.lastName[0],
                style: TextStyle(
                  color: _colorList[index]["text"].withOpacity(0.5),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.firstName} ${widget.lastName}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.pid,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
