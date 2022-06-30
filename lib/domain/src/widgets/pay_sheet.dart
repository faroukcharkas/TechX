import 'package:flutter/material.dart';
import 'package:techx/domain/domain.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PaySheet extends StatelessWidget {
  const PaySheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TECHX_URL = "https://www.google.com/";

    return SheetTemplate(
      title: "Dues",
      child: Container(
        height: 300,
        width: double.infinity,
        child: FutureBuilder(
          future: canLaunchUrlString(TECHX_URL),
          builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
          ) {
            List<Widget> builtScreen = [
              Text(
                "Due to Apple's policy, we are unable to take due payments through the app. Navigate to our website to pay dues. (sorry abt that)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ];

            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (snapshot.data == true) {
                builtScreen.add(
                  BasicButton(
                    minWidth: double.infinity,
                    color: Colors.blue,
                    enabledText: "Open Our Website",
                    onTap: () {
                      launchUrlString(TECHX_URL);
                    },
                  ),
                );
              }
            }

            return Column(
              children: builtScreen,
            );
          },
        ),
      ),
    );
  }
}
