import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/view/view.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  List<Widget> _views = [
    HomeView(),
    PassView(),
    EventsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return FullTemplate(
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
