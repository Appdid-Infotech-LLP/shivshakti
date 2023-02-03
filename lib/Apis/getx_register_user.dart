import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shivshakti/DataModels/user_model.dart';
import 'package:shivshakti/Screens/HomeScreen/home_screen.dart';
import 'package:shivshakti/Screens/InitialsScreens/otp_verification_screen.dart';
import 'package:shivshakti/Services/api_calls.dart';
import 'package:shivshakti/Services/getx_const_functions.dart';

class GetXRegistration extends GetxController{
  final call = ApiCalls();
  Rx<UserModel> userData = UserModel().obs;
  var otp = TextEditingController().obs;
  var id = TextEditingController().obs;
  var pass = TextEditingController().obs;
  var number = TextEditingController().obs;
  var name = TextEditingController().obs;
  var aadhar = TextEditingController().obs;
  var email = TextEditingController().obs;
  var confirmPass = TextEditingController().obs;
  GetXConstFunctions getDeviceId = Get.put(GetXConstFunctions());

  registrationApiCall(context)async{
    final prefs = await SharedPreferences.getInstance();
    if(id.value.text != ''  && pass.value.text != '' && number.value.text != '' && name.value.text != '' && aadhar.value.text != '' && email.value.text != '' ){
      if(confirmPass.value.text == pass.value.text){
        getDeviceId.getDeviceId().then((value) async{
          log("${id.value.text} ${pass.value.text} ${name.value.text} ${number.value.text} ${email.value.text} ${aadhar.value.text} ${prefs.getString("DeviceId")}");
          Fluttertoast.showToast(msg: "Registration in process...");
          try{
            log("-----");
            await call.commonApiCallResponse("registerLeader.php", {
              "slug": slug,
              "aAcc": id.value.text,
              "aPswd": pass.value.text,
              "aName": name.value.text,
              "aMobile": number.value.text,
              "aEmail": email.value.text,
              "aAadhaar": aadhar.value.text,
              "aDeviceId": prefs.getString("DeviceId"),
            }).then((value) {
              // log(value, name: "registrationApiCall");
              Fluttertoast.cancel();
              if(jsonDecode(value)['status'] == 'success'){
                prefs.setString("UserId", jsonDecode(value)['userid']);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                  return OtpScreen();
                }));
              }else if(jsonDecode(value)['status'] == 'failure'){
                Fluttertoast.showToast(msg: jsonDecode(value)['msg'], textColor: Colors.white, backgroundColor: Colors.red);
              }
            });
          }catch(e){
              log("Error at registrationApiCall----------------------------$e");
          }
        });
      }else{
        Fluttertoast.showToast(msg: "Password does not match");
      }

    }else{
      Fluttertoast.showToast(msg: "Fill_Up Details");
    }
  }

  Future otpVerification(context)async{
    final prefs = await SharedPreferences.getInstance();
    Fluttertoast.showToast(msg: 'Verifying...');
    log(prefs.getString("UserId").toString());
    if(otp.value.text != ''){
      await call.commonApiCallResponse("verifyOtp.php", {
        "slug": slug,
        "aId": prefs.getString("UserId"),
        "otp": otp.value.text,
        "aDeviceId": prefs.getString("DeviceId"),
      }).then((value) {
        log(value, name: "otpVerification");
        if(jsonDecode(value)['status'] == 'success'){
          userData.value = userModelFromJson(jsonEncode(jsonDecode(value)['leaderdata']));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
            return HomeScreen();
          }));
        }else{
          Fluttertoast.showToast(msg: jsonDecode(value)['msg']);
        }
      });
    }else{
      Fluttertoast.showToast(msg: 'Enter 6 Digit OTP');
    }
  }
}