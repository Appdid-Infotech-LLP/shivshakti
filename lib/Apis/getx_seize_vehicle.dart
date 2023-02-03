import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shivshakti/Services/api_calls.dart';

class GetXSeizeVehicle extends GetxController{
  ApiCalls calls = ApiCalls();
  seizeVehicleApiCall(vId)async{
    final prefs = await SharedPreferences.getInstance();
    await calls.commonApiCall("seizedvehicles.php", {
      "slug": slug,
      "aId": prefs.getString("UserId"),
      "vId": vId,
    }).then((value) {
      // log(value.toString(), name: "seizeVehicleApiCall");
      Fluttertoast.showToast(msg: value['msg']);
    });
  }
}