import 'dart:developer';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetXConstFunctions extends GetxController {
  var deviceInfo = DeviceInfoPlugin().obs;
  Future getDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    if (Platform.isAndroid) {
      var data = await deviceInfo.value.androidInfo;
      log(data.androidId.toString(), name: 'DEVICE ID');
      prefs.setString("DeviceId", data.androidId.toString());
      return data.androidId.toString();
    } else {
      // prefs.setString("DeviceId", "123");
      return '';
    }
  }
}
