import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/model/model.dart';
import 'package:techx/view/view.dart';
import 'package:techx/controller/controller.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    AuthUtility.setAuthListener(
      (User user) {
        Provider.of<UserDataController>(context, listen: false)
            .setUserModelFromFirebase();
      },
      () {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        Provider.of<UserDataController>(context, listen: true).getUserModel;
    List<Widget> _views = [
      HomeView(
        pageController: _pageController,
        rank: userModel.getRank,
        isMember: userModel.getIsMember,
        lastStatusUpdate: DateTime.now(),
      ),
      PassView(
        rank: userModel.getRank,
        pid: userModel.getPID,
        lastName: userModel.getLastName,
        firstName: userModel.getFirstName,
      ),
      EventsView(),
      ProfileView(
        firstName: userModel.getFirstName,
        lastName: userModel.getLastName,
        pid: userModel.pid,
        memberProgressionIndex: userModel.getMemberProgressIndex,
        rank: userModel.getRank,
        pointsUntilNextRank: userModel.getPointsTillNextRank(userModel.getRank),
        duesAmount: "25",
        hasPaid: userModel.getHasPaid,
      ),
    ];

    return FullTemplate(
      points: userModel.getPoints,
      onTap: (newIndex) {
        _pageController.animateToPage(newIndex,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      navBarIndex: _currentIndex,
      body: PageView(
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        controller: _pageController,
        children: _views,
      ),
    );
  }
}
