import 'package:flutter/material.dart';
import 'package:school_management/constants.dart';
import 'package:school_management/screens/assignment_screen/data/assignment_data.dart';

class AssignmentScreen extends StatelessWidget {
  static String routeName  = "AssignmentScreen";
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment",style: TextStyle(color: kTextWhiteColor,fontSize: 28),),
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
              width: size.width,
              decoration: const BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  )
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: assignment.length,
                itemBuilder: (context, index){
                  return Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    margin: const EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding),
                      color: kOtherColor,
                      boxShadow: const [
                        BoxShadow(
                          color: kTextLightColor,
                          blurRadius: 2.0
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kDefaultPadding),
                            color: kOtherColor,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 110,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: kSecondaryColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(kDefaultPadding),
                                ),
                                child: Center(child: Text(
                                  assignment[index].subjectName,
                                  style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(assignment[index].topicName,style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0
                        ),),
                        const SizedBox(height: 10,),
                        assignmentDetailRow(index: index,title: "Assignment Date",statusVal:assignment[index].assignDate),
                        const SizedBox(height: 10,),
                        assignmentDetailRow(index: index,title: "Last Date",statusVal:assignment[index].lastDate),
                        const SizedBox(height: 10,),
                        assignmentDetailRow(index: index,title: "Status",statusVal:assignment[index].status),
                        const SizedBox(height: 10,),
                        if(assignment[index].status == "Pending")
                          AssignmentButton(
                            onPress: (){},
                            title: "To be Submitted",
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AssignmentButton extends StatelessWidget {
  const AssignmentButton({
    super.key, required this.onPress, required this.title,
  });
  final VoidCallback onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 45.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kSecondaryColor, kPrimaryColor],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0,1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
        ),
        child: Center(
          child: Text(title,style: const TextStyle(color: kTextWhiteColor,fontSize: 22,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}

class assignmentDetailRow extends StatelessWidget {
  const assignmentDetailRow({
    super.key, required this.index, required this.title, required this.statusVal,
  });
  final int index;
  final String title;
  final String statusVal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: const TextStyle(
            fontSize: 15.0,
            color: kTextLightColor
        ),),
        Text(statusVal,style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600
        ),),
      ],
    );
  }
}
