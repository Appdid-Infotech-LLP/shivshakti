import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shivshakti/Apis/getx_extras.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Widgets/text_varients.dart';

import 'package:sizer/sizer.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final aboutInstance = Get.put(GetXExtras());
  @override
  void initState() {
    super.initState();
    aboutInstance.getExtras();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
            color: secondaryColor
        ),
        title: Text("Contact Us", style: GoogleFonts.asap(fontWeight: FontWeight.w600, color: secondaryColor),),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.h,),
              Image.asset(
                "assets/images/logo.png",
                height: size!.height*0.2,
                width: size!.width,
              ),
              SizedBox(height: 5.h,),
              GetX<GetXExtras>(
                  builder: (_) {
                    return
                      Card(
                        child: SizedBox(
                          width: 80.w,
                          child: Padding(
                            padding: EdgeInsets.all(10.0.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 2.h,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "Contact No.", textSize: 9.0.sp,),
                                    SizedBox(height: 0.5.h,),
                                    CustomText(text: _.extras.value.contactUsMoblie, textColor: Colors.grey[900], textSize: 12.0.sp,),
                                  ],
                                ),
                                SizedBox(height: 2.h,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: "Email", textSize: 9.0.sp,),
                                    SizedBox(height: 0.5.h,),
                                    CustomText(text: _.extras.value.contactUsMail, textOverflow: TextOverflow.clip, textColor: Colors.grey[900], textSize: 12.0.sp,),
                                  ],
                                ),
                                SizedBox(height: 2.h,),
                              ],
                            ),
                          ),
                        ),
                      );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
