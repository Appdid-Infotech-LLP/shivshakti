import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shivshakti/Apis/getx_extras.dart';
import 'package:shivshakti/Apis/getx_splash.dart';
import 'package:shivshakti/Screens/InitialsScreens/login_screen.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Services/getx_const_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GetXConstFunctions getDeviceId  = Get.put(GetXConstFunctions());
  GetXSplashApi splashApiCallInstance = Get.put(GetXSplashApi());
  GetXExtras extras = Get.put(GetXExtras());
  navigator()async{
    final prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(milliseconds: 1000),(){
      if(prefs.getString("UserId") == null || prefs.getString("UserId") == "0"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
          return LoginScreen();
        }));
      }else{
        splashApiCallInstance.splashApiCall(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDeviceId.getDeviceId().then((value) {
      navigator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        height: size!.height,
        width: size!.width,
        child: Center(
          child: Image.asset(
              'assets/images/logo.png',
            width: size!.width*0.8,
          ),
        ),
      ),
    );
  }
}
