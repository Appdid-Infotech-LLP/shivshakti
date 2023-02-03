import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shivshakti/Apis/getx_splash.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Widgets/text_varients.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.grey[700]
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomText(
          text: "Profile",
          textSize: 16.0.sp,
          /*textColor: Colors.white,*/
          textWeight: FontWeight.w800,
        ),
      ),
      body: SizedBox(
        height: size!.height,
        width: size!.width,
        child: GetX<GetXSplashApi>(
          init: GetXSplashApi(),
          builder: (_) {
            return Column(
              children: [
                SizedBox(height: 4.0.h,),
                CircleAvatar(
                  radius: 30.0.sp,
                  backgroundColor: primaryColor,
                  child: CustomText(text: _.userData.value.aName!.toString().split('')[0], textSize: 30.0.sp, textColor: Colors.white,),
                ),
                SizedBox(height: 4.0.h,),
                SizedBox(
                  width: size!.width*0.8,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomText(text: 'Account ID  :  ', textSize: 10.0.sp, /*textColor: Colors.grey[400],*/),
                              CustomText(text: _.userData.value.aAccountId!, textSize: 12.0.sp, textColor: Colors.grey[800],),
                            ],
                          ),
                          SizedBox(height: 1.0.h,),
                          Row(
                            children: [
                              CustomText(text: 'Name  :  ', textSize: 10.0.sp, /*textColor: Colors.grey[400],*/),
                              CustomText(text: _.userData.value.aName!, textSize: 12.0.sp, textColor: Colors.grey[800],),
                            ],
                          ),
                          SizedBox(height: 1.0.h,),
                          Row(
                            children: [
                              CustomText(text: 'Mobile No.  :  ', textSize: 10.0.sp, /*textColor: Colors.grey[400],*/),
                              CustomText(text: _.userData.value.aMobile!, textSize: 12.0.sp, textColor: Colors.grey[800],),
                            ],
                          ),
                          SizedBox(height: 1.0.h,),
                          Row(
                            children: [
                              CustomText(text: 'Email  :  ', textSize: 10.0.sp, /*textColor: Colors.grey[400],*/),
                              CustomText(text: _.userData.value.aEmail!, textSize: 12.0.sp, textColor: Colors.grey[800],),
                            ],
                          ),
                          SizedBox(height: 1.0.h,),
                          Row(
                            children: [
                              CustomText(text: 'Adhaar  :  ', textSize: 10.0.sp, /*textColor: Colors.grey[400],*/),
                              CustomText(text: _.userData.value.aAadhaarCard!, textSize: 12.0.sp, textColor: Colors.grey[800],),
                            ],
                          ),
                          SizedBox(height: 1.0.h,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
