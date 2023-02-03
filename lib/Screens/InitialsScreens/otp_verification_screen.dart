import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shivshakti/Apis/getx_register_user.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Widgets/text_varients.dart';
import 'package:sizer/sizer.dart';

class OtpScreen extends StatelessWidget {
  final otpVerification = Get.put(GetXRegistration());
  OtpScreen({Key? key}) : super(key: key);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomText(
                      text: "Call Admin and Get Your OTP",
                      textSize: 12.0.sp,
                      // textDecoration: TextDecoration.underline,
                      textColor: secondaryColor,
                      textWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    GetX<GetXRegistration>(
                      builder: (_) {
                        return Container(
                          width: size!.width*0.5,
                          height: size!.height*0.05,
                          color: Colors.transparent,
                          child: SizedBox(
                            width: size!.width*0.71,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.quicksand(color: Colors.grey.shade200, fontWeight: FontWeight.w600, letterSpacing: 20),
                              cursorColor: Colors.white,
                              controller: _.otp.value,
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
                                  hintText: "******",
                                  hintStyle: GoogleFonts.quicksand(color: Colors.grey[500], letterSpacing: 20)
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: size!.width*0.34,
                      child: MaterialButton(
                        color: secondaryColor,
                        onPressed: (){
                          otpVerification.otpVerification(context);
                        },
                        child: CustomText(text: 'Verify', textColor: Colors.white, styleType: 0, textSize: 12.0.sp,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
