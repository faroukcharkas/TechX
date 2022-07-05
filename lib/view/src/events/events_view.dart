import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/model/model.dart';
import 'package:jiffy/jiffy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsView extends StatefulWidget {
  const EventsView({Key? key}) : super(key: key);

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  final Stream<QuerySnapshot> _eventStream =
      FirebaseFirestore.instance.collection('events').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _eventStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return SimpleErrorWidget(
            message: "Can't Load Events",
            secondaryMessage:
                "Let a Board Member know of this error: ${snapshot.error.toString()}.",
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SimpleLoadingWidget(
            message: "Loading Events",
            secondaryMessage:
                "Taking too long? Let a Board Member know. May take a while as we're sending carrier pigeons to deliver the data right now.",
          );
        }

        if (snapshot.connectionState == ConnectionState.active) {
          List<EventModel> eventList = [];

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            if (DateTime.parse(data["beginTime"]).isAfter(DateTime.now())) {
              eventList.add(EventModel.fromJSON(data));
            }
          }).toList();

          ScheduleModel scheduleModel = ScheduleModel(events: eventList);

          NotificationUtility.scheduleFromEventList(eventList);

          return ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: (() {
                    List<Widget> builtWidgets = [];
                    List<EventModel> todayEvents =
                        scheduleModel.getEventsToday();
                    List<EventModel> futureEvents =
                        scheduleModel.getEventsNotToday();

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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
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

        return SimpleErrorWidget(
          message: "Oops...",
          secondaryMessage:
              "Let a Board Member know if this problem is still persisting. In the meanwhile, please try again.",
        );
      },
    );
  }
}
