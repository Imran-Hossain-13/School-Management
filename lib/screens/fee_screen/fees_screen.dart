import 'package:flutter/material.dart';
import 'package:school_management/constants.dart';
import 'package:school_management/screens/fee_screen/data/fee_data.dart';

class FeeScreen extends StatelessWidget {
  static String routeName  = "FeeScreen";
  const FeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fees",style: TextStyle(color: kTextWhiteColor,fontSize: 28),),
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
                padding: const EdgeInsets.all(kDefaultPadding),
                itemCount: fee.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: const EdgeInsets.only(bottom: kDefaultPadding),
                      width: size.width,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            width: size.width,
                            decoration: const BoxDecoration(
                              color: kTextWhiteColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(kDefaultPadding),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: kTextLightColor,
                                  blurRadius: 2.0
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                FeesWidget(value: fee[index].receiptNo,title: "Receipt No",),
                                const SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1.0,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                FeesWidget(value: fee[index].month,title: "Month",),
                                const SizedBox(
                                  height: kDefaultPadding,
                                ),
                                FeesWidget(value: fee[index].date,title: "Payment Date",),
                                const SizedBox(
                                  height: kDefaultPadding,
                                ),
                                FeesWidget(value: fee[index].paymentStatus,title: "Status",),
                                const SizedBox(height: 10,),
                                const SizedBox(
                                  height: kDefaultPadding,
                                  child: Divider(
                                    thickness: 1.0,
                                  ),
                                ),
                                FeesWidget(value: fee[index].totalAmount,title: "Total Amount",),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: kDefaultPadding),
                            width: size.width,
                            height: 50.0,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [kSecondaryColor, kPrimaryColor],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(0.5, 0.0),
                                stops: [0.0,1.0],
                                tileMode: TileMode.clamp,
                              ),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(kDefaultPadding)
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: kTextLightColor,
                                    blurRadius: 3.0
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                Text(fee[index].btnStatus,style: const TextStyle(
                                    color: kTextWhiteColor,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w500
                                ),),
                                const Spacer(),
                                const Icon(Icons.arrow_forward,color: Colors.white,size: 25,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeesWidget extends StatelessWidget {
  const FeesWidget({
    super.key, required this.title, required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: const TextStyle(
          fontSize: 14.0,
          color: kTextLightColor
        ),),
        Text(value,style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600
        ),),
      ],
    );
  }
}


