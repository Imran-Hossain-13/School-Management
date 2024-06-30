import 'package:flutter/material.dart';
import 'package:school_management/constants.dart';
import 'package:school_management/routes.dart';
import 'package:school_management/screens/splash_screen/splash_screen.dart';

void main()async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "School Brain",
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
              fontSize: 22.0,
              color: kTextLightColor,
              height: 0.5,
          ),
          hintStyle: TextStyle(
              fontSize: 16.0,
              color: kTextBlackColor,
              height: 0.5
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kTextLightColor,
                width: 0.7,
              )
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kTextLightColor,
              )
          ),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kTextLightColor,
              )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
              )
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: kErrorBorderColor,
                width: 1.2
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: kErrorBorderColor,
                width: 1.2
            ),
          ),
        )
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      // initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
