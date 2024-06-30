import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management/constants.dart';
import 'package:school_management/screens/home_screen/home_screen.dart';
import 'package:school_management/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? email;
  String? pass;
  getSharePrefData()async{
    SharedPreferences sharedPrefData = await SharedPreferences.getInstance();
    email = sharedPrefData.getString("email");
    pass = sharedPrefData.getString("pass");
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),()async{
      getSharePrefData();
      if(email == null && pass == null){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LogInScreen()));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen()));
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("School",style: TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 60.0,
                  fontStyle: FontStyle.italic,
                )),
                Text("Name",style: GoogleFonts.satisfy(
                  color: kTextWhiteColor,
                  fontSize: 60.0,
                )),
              ],
            ),
            Image.asset("assets/images/splash.png",height: 180,width: 180,),
          ],
        ),
      ),
    );
  }
}
