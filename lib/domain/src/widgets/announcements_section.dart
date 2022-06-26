import 'package:flutter/material.dart';
import 'package:techx/model/model.dart';

class AnnouncementsSection extends StatelessWidget {
  const AnnouncementsSection({
    Key? key,
    required this.announcements,
  }) : super(key: key);

  final List<AnnouncementModel> announcements;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.white,
          width: 0.25,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 0.25,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.campaign,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Announcements",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
