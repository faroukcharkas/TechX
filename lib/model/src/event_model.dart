import 'package:jiffy/jiffy.dart';

class EventModel {
  EventModel({
    required this.eventType,
    required this.title,
    required this.description,
    required this.location,
    required this.beginTime,
    required this.endTime,
  });

  final String eventType;
  final String title;
  final String description;
  final String location;
  final DateTime beginTime;
  final DateTime endTime;

  String get getType {
    return eventType;
  }

  String get getTitle {
    return title;
  }

  String get getDesc {
    return description;
  }

  String get getLocation {
    return location;
  }

  DateTime get getBeginTime {
    return beginTime;
  }

  DateTime get getEndTime {
    return endTime;
  }

  String get timeString {
    String beginTimeString = Jiffy(beginTime).format("EEEE, MMMM do h:mm");
    String endTimeString = Jiffy(endTime).format("h:mm a");
    return "$beginTimeString - $endTimeString";
  }

  String get fromNow {
    return Jiffy(beginTime).fromNow();
  }

  String get intraDayTime {
    String intraDayTime = Jiffy(beginTime).format("h:mm a");
    return intraDayTime;
  }

  factory EventModel.fromJSON(Map<String, dynamic> json) {
    return EventModel(
      eventType: json["eventType"] ?? "EVNT",
      title: json["title"] ?? "Oops...",
      description: json["description"] ??
          "this is kinda awkward, for some reason this event is broken..?",
      location: json["location"] ?? "TechX HQ",
      beginTime: DateTime.parse(json["beginTime"] ??
          DateTime.now().subtract(Duration(days: 10)).toString()),
      endTime: DateTime.parse(json["endTime"] ??
          DateTime.now().subtract(Duration(days: 10)).toString()),
    );
  }
}
