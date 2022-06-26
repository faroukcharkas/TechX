import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/model/model.dart';
import 'package:jiffy/jiffy.dart';

class EventsView extends StatelessWidget {
  const EventsView({Key? key, required this.scheduleModel}) : super(key: key);

  final ScheduleModel scheduleModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: (() {
              List<Widget> builtWidgets = [];
              List<EventModel> todayEvents = scheduleModel.getEventsToday();
              List<EventModel> futureEvents = scheduleModel.getEventsNotToday();

              void buildEvent(EventModel eventModel) {
                builtWidgets.add(Event(
                  eventType: eventModel.getType,
                  title: eventModel.getTitle,
                  description: eventModel.getDesc,
                  location: eventModel.getLocation,
                  timeString: eventModel.timeString,
                  fromNowString: eventModel.fromNow,
                ));
              }

              void buildSpace({double height = 20.0}) {
                builtWidgets.add(Container(
                  color: Colors.white,
                  width: 0.25,
                  height: height,
                ));
              }

              void buildTodayDeclaration() {
                builtWidgets.add(Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.blue,
                      width: 0.25,
                    ),
                  ),
                  child: Text(
                    "Today, ${Jiffy(DateTime.now()).format("EEEE, MMMM do")}",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ));
              }

              void buildFutureDeclaration() {
                builtWidgets.add(Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.25,
                    ),
                  ),
                  child: Text(
                    "In the Future",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ));
              }

              void buildEndDeclaration() {
                builtWidgets.add(Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.25,
                    ),
                  ),
                  child: Text(
                    "No more events. More coming soon!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ));
              }

              if (todayEvents.length != 0) {
                buildTodayDeclaration();
                buildSpace(height: 20.0);
                for (var i = 0; i < todayEvents.length; i++) {
                  buildEvent(todayEvents[i]);
                  if (i != todayEvents.length - 1) {
                    buildSpace(height: 20.0);
                  }
                }
              }

              if (futureEvents.length != 0) {
                if (todayEvents.length != 0) {
                  buildSpace(height: 60.0);
                }
                buildFutureDeclaration();
                buildSpace(height: 20.0);
                for (var i = 0; i < futureEvents.length; i++) {
                  buildEvent(futureEvents[i]);
                  if (i != futureEvents.length - 1) {
                    buildSpace(height: 40.0);
                  }
                }
              }

              if (futureEvents.length != 0 || todayEvents.length != 0) {
                buildSpace(height: 40.0);
              }

              buildEndDeclaration();

              return builtWidgets;
            })(),
          ),
        )
      ],
    );
  }
}
