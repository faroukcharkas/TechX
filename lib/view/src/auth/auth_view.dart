import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:techx/view/src/login/login_view.dart';
import 'package:techx/view/src/registration/registration_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    return TitledTemplate(
      body: PageView(
        controller: _pageController,
        children: [
          RegistrationView(
            controller: _pageController,
          ),
          LoginView(
            controller: _pageController,
          ),
        ],
      ),
    );
  }
}
