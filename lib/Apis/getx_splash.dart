import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shivshakti/DataModels/user_model.dart';
import 'package:shivshakti/Screens/HomeScreen/home_screen.dart';
import 'package:shivshakti/Screens/InitialsScreens/login_screen.dart';
import 'package:shivshakti/Screens/InitialsScreens/otp_verification_screen.dart';
import 'package:shivshakti/Services/api_calls.dart';
import 'package:shivshakti/Services/getx_const_functions.dart';
import 'package:shivshakti/Widgets/restriction_dialog.dart';

class GetXSplashApi extends GetxController {
  ApiCalls calls = ApiCalls();
  GetXConstFunctions getDeviceId = Get.put(GetXConstFunctions());
  Rx<UserModel> userData = UserModel().obs;
  Future splashApiCall(context)async{
    final prefs = await SharedPreferences.getInstance();
    getDeviceId.getDeviceId().then((value) async{
      await calls.commonApiCallResponse("splashScreen.php", {
        "slug": slug,
        "aId": prefs.getString("UserId"),
        "aDeviceId": prefs.getString("DeviceId"),
      }).then((value) {
        // log(value, name:"splashApiCall");
        if(jsonDecode(value)['status'] == 'success'){
          userData.value = userModelFromJson(jsonEncode(jsonDecode(value)['leaderdata']));
          if(userData.value.aIsApproved == '1'){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
              return HomeScreen();
            }));
          }else{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
              return OtpScreen();
            }));
          }
        }else if(jsonDecode(value)['status'] == 'denied'){
          Fluttertoast.showToast(msg: jsonDecode(value)['msg']);
          prefs.clear();
          Get.reset();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
            return LoginScreen();
          }));
        }else{
          showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.8),
            context: context,
            barrierDismissible: false,
            barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation1, animation2) {
              return RestrictionDialog(heading:  jsonDecode(value)['msg']);
            },
          );
        }
      });
    });
  }
}