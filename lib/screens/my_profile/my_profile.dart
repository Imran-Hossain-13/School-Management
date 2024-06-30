import 'package:flutter/material.dart';
import 'package:school_management/constants.dart';

class MyProfileScreen extends StatelessWidget {
  static String routeName  = "HomeScreen";
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile",style: TextStyle(color: kTextWhiteColor,fontSize: 25),),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.arrow_back_ios,color: kTextWhiteColor,size: 28,)),
        ),
        actions: [
          InkWell(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Sorry this feature is not available yet..",style: TextStyle(color: kTextWhiteColor),),
                    backgroundColor: kPrimaryColor,
                    duration: Duration(seconds: 3),
                  ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                children: [
                  Icon(Icons.report_gmailerrorred_outlined,color: kTextWhiteColor,size: 25,),
                  SizedBox(width: 3,),
                  Text("Report",style: TextStyle(color: kTextWhiteColor,fontSize: 20),)
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 160,
            width: size.width,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(kDefaultPadding*3),
                bottomRight: Radius.circular(kDefaultPadding*3),
              )
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  minRadius: 50,
                  maxRadius: 50,
                  backgroundColor: kSecondaryColor,
                  backgroundImage: AssetImage("assets/images/student_profile.png"),
                ),
                SizedBox(width: kDefaultPadding + 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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
                    SizedBox(height: 10,),
                    Text(
                      "Class XII | Roll No: 12",
                      style: TextStyle(
                          color: kTextWhiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileRowCard(size: size,title: "Registration Number",subTitle: "2023-ASDF-2024",),
              ProfileRowCard(size: size,title: "Academic Year",subTitle: "2023-2024",),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileRowCard(size: size,title: "Admission Class",subTitle: "X-II",),
              ProfileRowCard(size: size,title: "Admission Number",subTitle: "000126",),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileRowCard(size: size,title: "Date of Admission",subTitle: "1 Jan 2023",),
              ProfileRowCard(size: size,title: "Date of Birth",subTitle: "11-12-2003",),
            ],
          ),
          const SizedBox(height: kDefaultPadding,),
          ProfileDetailColumn(size: size,title: "E-mail",value: mobilePattern,),
          ProfileDetailColumn(size: size,title: "Father Name",value: "Nurul Islam",),
          ProfileDetailColumn(size: size,title: "Mother Name",value: "Shahanaj Begum",),
          ProfileDetailColumn(size: size,title: "Mobile Number",value: "IH Imon",),
        ],
      ),
      backgroundColor: kOtherColor,
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn({
    super.key,
    required this.size, required this.title, required this.value,
  });

  final Size size;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: kTextLightColor,
                  fontSize: 17,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: size.width / 1.1,
                child: const Divider(thickness: 1.0,),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProfileRowCard extends StatelessWidget {
  const ProfileRowCard({
    super.key,
    required this.size, required this.title, required this.subTitle,
  });

  final Size size;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: size.width,
      padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: kTextLightColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: kDefaultPadding / 2,),
              Text(
                subTitle,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                ),),
              SizedBox(
                width: size.width / 3,
                child: const Divider(thickness: 1.0,),
              )
            ],
          ),
          const Icon(Icons.lock_outlined)
        ],
      ),
    );
  }
}
