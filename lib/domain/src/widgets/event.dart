import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  const Event({
    Key? key,
    required this.title,
    required this.description,
    required this.location,
    required this.eventType,
    required this.timeString,
    required this.fromNowString,
  }) : super(key: key);

  final String title;
  final String description;
  final String location;
  final String eventType;
  final String timeString;
  final String fromNowString;

  Color _getEventColor() {
    switch (eventType) {
      case 'COMP':
        return Colors.blue;
      case 'PFDV':
        return Colors.green;
      case 'TALK':
        return Colors.purple;
      case 'SOCI':
        return Colors.lightBlueAccent;
      default:
        return Colors.black;
    }
  }

  IconData _getEventIcon() {
    switch (eventType) {
      case 'COMP':
        return Icons.emoji_events;
      case 'PFDV':
        return Icons.work;
      case 'TALK':
        return Icons.record_voice_over;
      case 'SOCI':
        return Icons.emoji_people;
      default:
        return Icons.event;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 0.25,
          ),
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [
              _getEventColor(),
              Colors.black,
            ],
            stops: [0, 0.5],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _getEventIcon(),
                color: Colors.white,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Icon(
                Icons.schedule,
                color: Colors.white.withOpacity(0.8),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                timeString,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 16.0,
                width: 24.5,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                fromNowString,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Icon(
                Icons.place_outlined,
                color: Colors.white.withOpacity(0.8),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                location,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
