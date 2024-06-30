import 'package:flutter/cupertino.dart';
import 'package:school_management/screens/assignment_screen/assignment_screen.dart';
import 'package:school_management/screens/datesheet_screen/datesheet_screen.dart';
import 'package:school_management/screens/fee_screen/fees_screen.dart';
import 'package:school_management/screens/home_screen/home_screen.dart';
import 'package:school_management/screens/login_screen.dart';
import 'package:school_management/screens/my_profile/my_profile.dart';
import 'package:school_management/screens/splash_screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => const SplashScreen(),
  LogInScreen.routeName : (context) => const LogInScreen(),
  HomeScreen.routeName : (context) => const HomeScreen(),
  MyProfileScreen.routeName : (context) => const MyProfileScreen(),
  FeeScreen.routeName : (context) => const FeeScreen(),
  AssignmentScreen.routeName : (context) => const AssignmentScreen(),
  HomeScreen.routeName : (context) => const HomeScreen(),
  // DateSheet.routeName : (context) => const DateSheet(),

};


