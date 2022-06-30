import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:async';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key, required this.controller})
      : super(key: key);

  final PageController controller;

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _formKey = GlobalKey<FormState>();
  String _password = "";

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
                "Register",
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
                  widget.controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Text(
                  "Already registered? Login!",
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
                      icon: Icons.text_fields,
                      label: "First Name",
                      hintText: "e.g. Farouk",
                      validator: RequiredValidator(
                          errorText:
                              "Hi (blank cuz u didn't fill this out), I'm dad."),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      icon: Icons.text_fields,
                      label: "Last Name",
                      hintText: "e.g. Charkas",
                      validator: RequiredValidator(
                        errorText: "You got a last name champ?",
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      icon: Icons.email_outlined,
                      label: "UNC Email",
                      hintText: "e.g. fcharkas@unc.edu",
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
                      keyboardType: TextInputType.number,
                      hintText: "e.g. 730483273",
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
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      icon: Icons.school_outlined,
                      label: "Expected Graduation Year",
                      hintText: "e.g. 2025",
                      keyboardType: TextInputType.number,
                      validator: MultiValidator(
                        [
                          PatternValidator(r"^(0|[1-9][0-9]*)$",
                              errorText: "Year must be numbers only."),
                          MinLengthValidator(4,
                              errorText: "Years need to have 4 digits."),
                          MaxLengthValidator(4,
                              errorText: "Years can only have 4 digits."),
                          RequiredValidator(
                              errorText: "You forgot to fill this out"),
                          PatternValidator("20",
                              errorText:
                                  "U a time traveler? U graduating within 20XX lmao"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      icon: Icons.campaign,
                      label: "How did you hear about us?",
                      hintText: "e.g. FallFest",
                      validator: RequiredValidator(
                        errorText: "plz answer honestly (i beg of thee)",
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      icon: Icons.lightbulb_outlined,
                      label: "What do you want out of joining TechX?",
                      hintText: "e.g. Get better at LeetCode!",
                      validator: MultiValidator(
                        [
                          RequiredValidator(
                            errorText:
                                "This will help us pair you with the right person!",
                          ),
                          MinLengthValidator(15,
                              errorText:
                                  "Come on you can write more than that..."),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    BasicButton(
                      color: Colors.blue,
                      enabled: true,
                      dynamicFeedback: true,
                      enabledText: "Join TechX",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Timer(
                            Duration(seconds: 4),
                            () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/welcome', (route) => false);
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
