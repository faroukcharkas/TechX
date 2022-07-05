import 'dart:async';

import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:techx/model/model.dart';
import 'package:provider/provider.dart';
import 'package:techx/controller/controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pidController = TextEditingController();

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Timer(Duration(seconds: 3), () {
          Navigator.pushNamedAndRemoveUntil(context, '/app', (route) => false);
        });
      }
    });
    super.initState();
  }

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
                      controller: emailController,
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
                      controller: pidController,
                      icon: Icons.tag,
                      label: "Personal Identification (PID)",
                      hintText: "e.g. 730483273",
                      keyboardType: TextInputType.number,
                      validator: MultiValidator(
                        [
                          PatternValidator(r"^(0|[1-9][0-9]*)$",
                              errorText: "PID must be numbers only."),
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
                      onTap: () {},
                      onAsyncTap: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            // Sign in
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: pidController.text,
                            );
                            // Set user data
                            Provider.of<UserDataController>(context,
                                    listen: false)
                                .setUserModelFromFirebase();
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'invalid-email') {
                              throw Exception('Invalid email lol');
                            } else if (e.code == 'user-disabled') {
                              throw Exception('Account disabled, contact us');
                            } else if (e.code == 'user-not-found') {
                              throw Exception('Email does not exist');
                            } else if (e.code == 'wrong-password') {
                              throw Exception('yo PID wrong');
                            }
                          }
                        } else {
                          throw Exception("Review fields above");
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
