import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shivshakti/DataModels/vehicle_model.dart';
import 'package:shivshakti/Services/api_calls.dart';

class GetSyncData extends GetxController{
  ApiCalls calls = ApiCalls();
  Rx<bool> searchDataLoading = false.obs;
  Rx<TextEditingController> number = TextEditingController().obs;
  RxList<VehicleModel> vehicleData = [VehicleModel(entrytime: '', vehiclenumber: '', id: '', financecompanyname: '', loanno: '', entrydate: DateTime.now(), make: '', customername: '')].obs;
  getSearchedVehicleData(List<VehicleModel> vehicles, s)async{
    searchDataLoading.value = true;
    vehicleData.clear();
    if(s.toString().length == 4){
      await calls.commonApiCallResponse("searchData.php", {
        "slug": slug,
        "vehicle": s.toString(),
      }).then((value) async{

        if(jsonDecode(value)['status'] == 'success'){
          List<dynamic> data = (jsonDecode(value)['vehicleData']);
          vehicleData.value = vehicleModelFromJson(jsonEncode(data));
          // vehicleModelFromJson(jsonEncode(data)).forEach((element) {
          //   vehicleData.add(element);
          // });
        }else{
          Fluttertoast.showToast(msg: "No such vehicle number");
        }
        number.value.clear();
      });
    }
    searchDataLoading.value = false;
  }
@override
  void onInit() {
    super.onInit();
    vehicleData.clear();
  }
}
