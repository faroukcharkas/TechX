import 'package:techx/model/model.dart';

class ScheduleModel {
  ScheduleModel({required this.events});

  final List<EventModel> events;

  List<EventModel> getEventsToday() {
    List<EventModel> eventsHappeningToday = [];
    // Get all events happening today
    for (EventModel event in events) {
      if (event.getBeginTime.day == DateTime.now().day) {
        eventsHappeningToday.add(event);
      }
    }

    // Sort by ascending time
    eventsHappeningToday.sort((a, b) => a.getBeginTime.millisecondsSinceEpoch
        .compareTo(b.getBeginTime.millisecondsSinceEpoch));

    return eventsHappeningToday;
  }

  List<EventModel> getEventsNotToday() {
    List<EventModel> eventsNotHappeningToday = [];
    // Get all events happening today
    for (EventModel event in events) {
      if (event.getBeginTime.day != DateTime.now().day &&
          event.getBeginTime.millisecondsSinceEpoch >
              DateTime.now().millisecondsSinceEpoch) {
        eventsNotHappeningToday.add(event);
      }
    }

    // Sort by ascending time
    eventsNotHappeningToday.sort((a, b) => a.getBeginTime.millisecondsSinceEpoch
        .compareTo(b.getBeginTime.millisecondsSinceEpoch));

    return eventsNotHappeningToday;
  }
}
