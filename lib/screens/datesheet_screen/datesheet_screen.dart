import 'package:flutter/material.dart';
import 'package:school_management/constants.dart';
import 'package:school_management/screens/datesheet_screen/sheet_date.dart';

class DateSheet extends StatelessWidget {
  static String routeName  = "HomeScreen";
  const DateSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Sheet",style: TextStyle(color: kTextWhiteColor,fontSize: 28),),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,color: kTextWhiteColor,size: 28,),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 2),
                  topRight: Radius.circular(kDefaultPadding* 2),
                )
              ),
              child: ListView.builder(
                itemCount: dataSheet.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: size.height / 8,
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kDefaultPadding,
                            child: Divider(
                              thickness: 1.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    dataSheet[index].date.toString(),
                                    style: const TextStyle(
                                        color: kTextBlackColor,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    dataSheet[index].monthName,
                                    style: const TextStyle(
                                        color: kTextBlackColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    dataSheet[index].subjName.toString(),
                                    style: const TextStyle(
                                        color: kTextBlackColor,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    dataSheet[index].dayName,
                                    style: const TextStyle(
                                        color: kTextBlackColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "⌚ ${dataSheet[index].timeName.toString()}",
                                    style: const TextStyle(
                                        color: kTextLightColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                            child: Divider(
                              thickness: 1.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            )
          )
        ],
      ),
    );
  }
}
