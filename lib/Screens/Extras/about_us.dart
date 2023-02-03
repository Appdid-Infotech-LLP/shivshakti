import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shivshakti/Apis/getx_extras.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Widgets/text_varients.dart';
import 'package:sizer/sizer.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: Text("About Us", style: GoogleFonts.asap(fontWeight: FontWeight.w600, color: secondaryColor),),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 60.w,
                height: 60.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 80.w,
                child: GetX<GetXExtras>(
                    builder: (_) {
                      return CustomText(text: _.extras.value.aboutUsDesc, textColor: Colors.white,);
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
