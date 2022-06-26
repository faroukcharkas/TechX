import 'dart:async';

import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 250.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontWeight: FontWeight.w800,
                  fontSize: 40.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  widget.controller.animateToPage(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Text(
                  "Don't have an account? Register!",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      icon: Icons.email_outlined,
                      label: "UNC Email",
                      hintText: "e.g. fcharkas@unc.edu",
                      keyboardType: TextInputType.emailAddress,
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                              errorText: "You gonna write your email?"),
                          EmailValidator(
                              errorText: "Bro that's not an email lol"),
                          PatternValidator("@unc.edu",
                              errorText: "Use ur @unc.edu email dawg"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      icon: Icons.tag,
                      label: "Personal Identification (PID)",
                      hintText: "e.g. 730483273",
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: "What's ur PID?"),
                          MinLengthValidator(9,
                              errorText:
                                  "PID not long enough, has to be 9 digits"),
                          MaxLengthValidator(9,
                              errorText: "PID is too long, has to be 9 digits"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    BasicButton(
                      color: Colors.blue,
                      enabled: true,
                      enabledText: "Login",
                      dynamicFeedback: true,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Timer(
                            Duration(seconds: 4),
                            () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/app', (route) => false);
                            },
                          );
                        } else {
                          throw ErrorHint("Fix errors above!");
                        }
                      },
                      minWidth: double.infinity,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
