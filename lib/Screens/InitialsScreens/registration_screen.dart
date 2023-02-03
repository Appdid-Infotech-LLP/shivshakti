import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shivshakti/Apis/getx_register_user.dart';
import 'package:shivshakti/Screens/InitialsScreens/login_screen.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Widgets/text_varients.dart';
import 'package:sizer/sizer.dart';

class UserRegistration extends StatelessWidget {
  final registration = Get.put(GetXRegistration());
  UserRegistration({Key? key}) : super(key: key);
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
            child: GetX<GetXRegistration>(
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 20.0.h,
                      width: 20.0.h,
                      child: Card(
                        elevation: 0,
                        color: primaryColor,
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: 0.h),
                          child: Image.asset(
                            "assets/images/logo.png",
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomText(
                          text: "User Registration",
                          textSize: 20.0.sp,
                          // textDecoration: TextDecoration.underline,
                          textColor: secondaryColor,
                          textWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.04,
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
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600, fontSize: 11.0.sp),
                                  // cursorColor: Colors.white,
                                  controller: _.name.value,
                                  // inputFormatters: <TextInputFormatter>[
                                  //   LengthLimitingTextInputFormatter(10)
                                  // ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade600),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.grey.shade600),
                                      ),
                                      border: const UnderlineInputBorder(),
                                      hintText: "Enter Name",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], fontSize: 11.0.sp)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.04,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Column(
                                children:  const [
                                  Spacer(),
                                  Icon(
                                    Icons.phone, color: secondaryColor,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const  Spacer(),
                              SizedBox(
                                width: size!.width*0.71,
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600, fontSize: 11.0.sp),
                                  // cursorColor: Colors.white,
                                  controller: _.number.value,
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade600),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.grey.shade600),
                                      ),
                                      border: const UnderlineInputBorder(),
                                      hintText: "Enter Contact Number",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], fontSize: 11.0.sp)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.04,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Column(
                                children:  const [
                                  Spacer(),
                                  Icon(
                                    Icons.mail, color: secondaryColor,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const  Spacer(),
                              SizedBox(
                                width: size!.width*0.71,
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600, fontSize: 11.0.sp),
                                  // cursorColor: Colors.white,
                                  controller: _.email.value,
                                  // inputFormatters: <TextInputFormatter>[
                                  //   LengthLimitingTextInputFormatter(10)
                                  // ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade600),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.grey.shade600),
                                      ),
                                      border: const UnderlineInputBorder(),
                                      hintText: "Enter Email",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], fontSize: 11.0.sp)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.04,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Column(
                                children:  const [
                                  Spacer(),
                                  Icon(
                                    Icons.document_scanner, color: secondaryColor,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const  Spacer(),
                              SizedBox(
                                width: size!.width*0.71,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600, fontSize: 11.0.sp),
                                  // cursorColor: Colors.white,
                                  controller: _.aadhar.value,
                                  // inputFormatters: <TextInputFormatter>[
                                  //   LengthLimitingTextInputFormatter(10)
                                  // ],
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade600),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color:  Colors.grey.shade600),
                                      ),
                                      border: const UnderlineInputBorder(),
                                      hintText: "Enter Adhaar Number",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], fontSize: 11.0.sp)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 8.h,
                          indent: 40.w,
                          endIndent: 40.w,
                          color: Colors.grey[600],
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.04,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Column(
                                children:  const [
                                  Spacer(),
                                  Icon(
                                    Icons.perm_identity, color: secondaryColor,
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const  Spacer(),
                              SizedBox(
                                width: size!.width*0.71,
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600, fontSize: 11.0.sp),
                                  // cursorColor: Colors.white,
                                  controller: _.id.value,
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
                                      hintText: "Create Agent ID",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], fontSize: 11.0.sp)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.04,
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
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600, fontSize: 11.0.sp),
                                  // cursorColor: Colors.white,
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
                                      hintText: "Create Password",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], fontSize: 11.0.sp)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: size!.width*0.8,
                          height: size!.height*0.04,
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
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600, fontSize: 11.0.sp),
                                  // cursorColor: Colors.white,
                                  controller: _.confirmPass.value,
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
                                      hintText: "Confirm Password",
                                      hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], fontSize: 11.0.sp)
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
                            color: secondaryColor,
                            onPressed: (){
                              registration.registrationApiCall(context);
                            },
                            child: CustomText(text: 'Continue', textColor: Colors.white, styleType: 0, textSize: 12.0.sp,),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0.sp),
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                                return LoginScreen();
                              }));
                            },
                            child: CustomText(
                            text: "<-To login",
                            textSize: 12.0.sp,
                            // textDecoration: TextDecoration.underline,
                            textColor: secondaryColor,
                            textWeight: FontWeight.w600,
                          ),),
                        )
                      ],
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
