import 'package:flutter/material.dart';
import 'package:school_management/constants.dart';
import 'package:school_management/screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  static String routeName = "SplashScreen";
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool passwordVisibility = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void setSharePrefData() async{
    SharedPreferences sharedPrefData = await SharedPreferences.getInstance();
    sharedPrefData.setString("email",email.text.toString());
    sharedPrefData.setString("pass",email.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode focus = FocusScope.of(context);
        if(!focus.hasPrimaryFocus){
          focus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 2.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/splash.png",
                    height: 170,
                    width: 170,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hi ",
                        style: TextStyle(
                            color: kTextWhiteColor,
                            fontSize: 38,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Students",
                        style: TextStyle(
                            color: kTextWhiteColor,
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Sign in to continue",
                    style: TextStyle(
                        color: kTextWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                    color: kOtherColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kDefaultPadding * 2),
                        topLeft: Radius.circular(kDefaultPadding * 2))),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            buildTextEmailField(),
                            const SizedBox(
                              height: kDefaultPadding,
                            ),
                            buildTextPassField(),
                            const SizedBox(
                              height: kDefaultPadding*3,
                            ),
                            InkWell(
                              onTap: ()async{
                                if(_formKey.currentState!.validate()){

                                }else if(email.text == mobilePattern && pass.text == passPattern ){
                                  setSharePrefData();
                                  Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                                }else{
                                  SnackBar sc = const SnackBar(
                                    content: Text("Email or password doesn't match",style: TextStyle(color: kTextWhiteColor),),
                                    backgroundColor: kPrimaryColor,
                                    duration: Duration(seconds: 3),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(sc);
                                }
                              },
                              child: Container(
                                height: 60.0,
                                width: size.width,
                                margin: const EdgeInsets.only(
                                  left: kDefaultPadding,
                                  right: kDefaultPadding
                                ),
                                padding: const EdgeInsets.only(
                                    left: kDefaultPadding,
                                    right: kDefaultPadding
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [kSecondaryColor,kPrimaryColor],
                                    begin: FractionalOffset(0.0,0.0),
                                    end: FractionalOffset(0.5,0.0),
                                    stops: [0.0,1.0],
                                    tileMode: TileMode.clamp,
                                  ),
                                  borderRadius: BorderRadius.circular(kDefaultPadding),
                                ),
                                child: const Row(
                                  children: [
                                    Spacer(),
                                    Text("SIGN IN",style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500
                                    ),),
                                    Spacer(),
                                    Icon(Icons.arrow_forward,color: kOtherColor,size: 30,)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: kDefaultPadding*3,
                            ),
                            InkWell(
                              onTap: (){
                                SnackBar sc = const SnackBar(
                                  content: Text("Sorry this feature is not available yet..",style: TextStyle(color: kTextWhiteColor),),
                                  backgroundColor: kPrimaryColor,
                                  duration: Duration(seconds: 3),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(sc);
                              },
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Text("Forgot Password",style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16.0,
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextEmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: email,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: kTextBlackColor,
        fontWeight: FontWeight.w400,
        fontSize: 17.0,
      ),
      cursorColor: kTextBlackColor,
      validator: (value) {
        RegExp regexp = RegExp(passPattern);
        if (value == null || value.isEmpty) {
          return "Please enter some text";
        } else if (!regexp.hasMatch(value)) {
          return "Please enter a valid email";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Mobile number/email",
      ),
    );
  }
  TextFormField buildTextPassField() {
    return TextFormField(
      obscureText: passwordVisibility,
      controller: pass,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: kTextBlackColor,
        fontWeight: FontWeight.w400,
        fontSize: 17.0,
      ),
      cursorColor: kTextBlackColor,
      validator: (value) {
        RegExp regexp = RegExp(mobilePattern);
        if (value == null || value.isEmpty) {
          return "Please enter some text";
        } else if (value.length < 5) {
          return "Must be more than 5 characters";
        } else if (!regexp.hasMatch(value)) {
          return "Please enter a valid password";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  passwordVisibility = !passwordVisibility;
                });
              },
              child: Icon(
                passwordVisibility == true
                    ? Icons.visibility_off_outlined
                    : Icons.visibility,
                size: 27,
                color: kTextLightColor,
              ))),
    );
  }

}
