import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_management/constants.dart';
import 'package:school_management/screens/assignment_screen/assignment_screen.dart';
import 'package:school_management/screens/datesheet_screen/datesheet_screen.dart';
import 'package:school_management/screens/fee_screen/fees_screen.dart';
import 'package:school_management/screens/login_screen.dart';
import 'package:school_management/screens/my_profile/my_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  static String routeName  = "HomeScreen";
  const HomeScreen({super.key});

  void setSharePrefData() async{
    SharedPreferences sharedPrefData = await SharedPreferences.getInstance();
    sharedPrefData.setString("email",'');
    sharedPrefData.setString("pass",'');
  }
  void mySnackBar(BuildContext context,String message){
    SnackBar sc = SnackBar(
      content: Text(message,style: TextStyle(color: kTextWhiteColor),),
      backgroundColor: kPrimaryColor,
      duration: Duration(seconds: 3),);
    ScaffoldMessenger.of(context).showSnackBar(sc);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // const SizedBox(height: kDefaultPadding*3,),
          Container(
            width: size.width,
            height: size.height / 2.5,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Hi ",
                              style: TextStyle(
                                  color: kTextWhiteColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                                "Student",
                              style: TextStyle(
                                  color: kTextWhiteColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Class XII | Roll No: 12",
                          style: TextStyle(
                              color: kTextWhiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                            color: kTextWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("2023-2024",style: TextStyle(color: kTextLightColor),)),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyProfileScreen()));
                      },
                      child: const CircleAvatar(
                        minRadius: 50,
                        maxRadius: 50,
                        backgroundColor: kSecondaryColor,
                        backgroundImage: AssetImage("assets/images/student_profile.png"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding * 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: size.height / 9,
                        width: size.width / 2.5,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Attendance",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "83.05%",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const FeeScreen()));
                      },
                      child: Container(
                        height: size.height / 9,
                        width: size.width / 2.5,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Fees Due",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "100\$",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding*3),
                  topRight: Radius.circular(kDefaultPadding*3),
                )
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const DateSheet()));
                            },
                            size: size,
                            iconUrl: "assets/icon/datesheet.svg",
                            myText: "Date Sheet"
                        ),
                        HomeCard(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AssignmentScreen()));
                            },
                            size: size,
                            iconUrl: "assets/icon/assignment.svg",
                            myText: "Assignment"
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onTap: (){
                              mySnackBar(context,"Sorry this feature is not available yet");
                            },
                            size: size,
                            iconUrl: "assets/icon/timetable.svg",
                            myText: "Time Table"
                        ),
                        HomeCard(
                            onTap: (){
                              mySnackBar(context,"Sorry this feature is not available yet");
                            },
                            size: size,
                            iconUrl: "assets/icon/holiday.svg",
                            myText: "Holiday"
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onTap: (){
                              mySnackBar(context,"Sorry this feature is not available yet");
                            },
                            size: size,
                            iconUrl: "assets/icon/result.svg",
                            myText: "Result"
                        ),
                        HomeCard(
                            onTap: (){
                              mySnackBar(context,"Sorry this feature is not available yet");
                            },
                            size: size,
                            iconUrl: "assets/icon/quiz.svg",
                            myText: "Take Quiz"
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onTap: (){
                              mySnackBar(context,"Sorry this feature is not available yet");
                            },
                            size: size,
                            iconUrl: "assets/icon/ask.svg",
                            myText: "Ask"
                        ),
                        HomeCard(
                            onTap: (){
                              mySnackBar(context,"Sorry this feature is not available yet");
                            },
                            size: size,
                            iconUrl: "assets/icon/gallery.svg",
                            myText: "Date Gallery"
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onTap: (){
                              mySnackBar(context,"Sorry this feature is not available yet");
                            },
                            size: size,
                            iconUrl: "assets/icon/event.svg",
                            myText: "Events"
                        ),
                        HomeCard(
                            onTap: (){
                              setSharePrefData();
                              Navigator.pushNamedAndRemoveUntil(context, LogInScreen.routeName, (route) => false);
                            },
                            size: size,
                            iconUrl: "assets/icon/logout.svg",
                            myText: "Logout"
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.onTap,
    required this.size,
    required this.iconUrl,
    required this.myText,
  });

  final VoidCallback onTap;
  final Size size;
  final String iconUrl;
  final String myText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 13),
        height: size.height / 6,
        width: size.width / 2.5,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconUrl,
              color: kTextWhiteColor,
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 5,),
            Text(
              myText,textAlign: TextAlign.center,
              style: const TextStyle(
                color: kTextWhiteColor,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
