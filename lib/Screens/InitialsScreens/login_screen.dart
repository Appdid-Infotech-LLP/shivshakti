import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shivshakti/Apis/getx_login.dart';
import 'package:shivshakti/Screens/InitialsScreens/registration_screen.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Widgets/text_varients.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  final getLoginInstance = Get.put(GetXLogin());
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: size!.width,
            child: GetX<GetXLogin>(
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 30.0.h,
                      width: 30.0.h,
                      child: Card(
                        elevation: 0,
                        color: primaryColor,
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: 0.h),
                          child: Image.asset(
                            "assets/images/logo.png",
                          ),

                          // Lottie.asset(
                          //     "assets/lottie/login.json",
                          //   height: 50.0.h
                          // ),
                        ),
                      ),
                    ),

                    Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                          text: "Agent Login",
                          textSize: 20.0.sp,
                          // textDecoration: TextDecoration.underline,
                          textColor: secondaryColor,
                          textWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.05,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Column(
                                children:  const [
                                  Spacer(),
                                  Icon(
                                    Icons.person, color: secondaryColor,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const  Spacer(),
                              SizedBox(
                                width: size!.width*0.71,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600),
                                  cursorColor: Colors.white,
                                  controller: _.id.value,
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(6)
                                  ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade600),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.grey.shade600),
                                      ),
                                      border: const UnderlineInputBorder(),
                                      hintText: "Enter Agent ID",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.05,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Column(
                                children:  const [
                                  Spacer(),
                                  Icon(
                                    Icons.keyboard, color: secondaryColor,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const  Spacer(),
                              SizedBox(
                                width: size!.width*0.71,
                                child: TextField(
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600),
                                  cursorColor: Colors.white,
                                  controller: _.pass.value,
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(8)
                                  ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade600),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.grey.shade600),
                                      ),
                                      border: const UnderlineInputBorder(),
                                      hintText: "Enter Password",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: size!.width*0.34,
                          child: MaterialButton(
                            elevation: 10,
                            color: secondaryColor,
                            onPressed: (){
                              if(_.id.value.text != '' && _.pass.value.text != ''){
                              getLoginInstance.loginApiCall(_.id.value.text, _.pass.value.text, context);
                              }else{
                                Fluttertoast.showToast(msg: "Enter a valid Credentials");
                              }
                            },
                            child: CustomText(text: 'Login', textColor: Colors.white, styleType: 0, textSize: 12.0.sp,),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: size!.width,
          height: size!.height*0.1,
          child: Column(
            children: [
              CustomText(
                text: "Register new agent",
                textSize: 8.0.sp,
                // textDecoration: TextDecoration.underline,
                textColor: primaryColor,
                textWeight: FontWeight.w600,
              ),
              SizedBox(
                width: size!.width*0.34,
                child: TextButton(
                  // color: primaryColor,
                  onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                     return UserRegistration();
                   }));
                  },
                  child: CustomText(text: 'Register', textColor: secondaryColor, styleType: 0, textSize: 12.0.sp,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
