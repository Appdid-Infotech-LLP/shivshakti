import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shivshakti/DataModels/user_model.dart';
import 'package:shivshakti/Screens/InitialsScreens/otp_verification_screen.dart';
import 'package:shivshakti/Services/api_calls.dart';
import 'package:shivshakti/Services/getx_const_functions.dart';
import 'getx_splash.dart';

class GetXLogin extends GetxController{
  final call = ApiCalls();
  Rx<UserModel> userData = UserModel().obs;
  var id = TextEditingController().obs;
  var pass = TextEditingController().obs;
  GetXConstFunctions getDeviceId = Get.put(GetXConstFunctions());
  GetXSplashApi splashScreenApiCall = Get.put(GetXSplashApi());

  loginApiCall(String id, pass, context)async{
    final prefs = await SharedPreferences.getInstance();
    Fluttertoast.showToast(msg: "Verifying...");
    getDeviceId.getDeviceId().then((value) async{
      // log(value);
      await call.commonApiCallResponse("login.php", {
        "slug": slug,
        "accId": id,
        "accPswd": pass,
        "deviceId": value,
      }).then((value) {
        log(value, name: "loginApiCall");
        if(jsonDecode(value)['status'] == 'success'){
          userData.value = userModelFromJson(jsonEncode(jsonDecode(value)['leaderdata']));
          prefs.setString("UserId",  userData.value.aId.toString());
          splashScreenApiCall.splashApiCall(context);
        }else if(jsonDecode(value)['status'] == 'failure'){
          Fluttertoast.showToast(msg: jsonDecode(value)['msg']);
        }else if(jsonDecode(value)['status'] == 'denied'){
          prefs.setString("UserId", jsonDecode(value)['userId']);
          Fluttertoast.showToast(msg: jsonDecode(value)['msg']);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
            return OtpScreen();
          }));
        }
      });
    });
  }
}