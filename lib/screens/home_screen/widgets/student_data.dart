import 'package:flutter/material.dart';
import 'package:school_management/constants.dart';

class StudentData extends StatelessWidget {
  const StudentData({
    super.key,
    required this.studentName,
    required this.className,
    required this.studentRoll,
  });

  final String studentName;
  final String className;
  final String studentRoll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text(
                  "Hi ",
                  style: TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  studentName,
                  style: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Text(
              "Class $className | Roll No: $studentRoll",
              style: const TextStyle(
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
            const SizedBox(height: kDefaultPadding * 2,),
          ],
        ),
      ],
    );
  }
}

class OtherData extends StatelessWidget {
  const OtherData({
    super.key,
    required this.myFunction,
    required this.title,
    required this.data,
  });

  final VoidCallback myFunction;
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: myFunction,
            child: Container(
              height: size.height / 9,
              width: size.width / 2.5,
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.circular(kDefaultPadding),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    data,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}




