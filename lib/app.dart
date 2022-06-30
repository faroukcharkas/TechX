import 'package:provider/provider.dart';
import 'domain/domain.dart';
import 'package:flutter/material.dart';
import 'view/view.dart';
import 'controller/controller.dart';

class TechX extends StatelessWidget {
  const TechX({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserDataController()),
      ],
      child: MaterialApp(
        title: 'TechX',
        debugShowCheckedModeBanner: false,
        theme: kThemeData,
        home: const SplashView(),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
