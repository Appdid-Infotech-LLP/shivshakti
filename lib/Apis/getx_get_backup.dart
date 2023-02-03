import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shivshakti/DataModels/backup_model.dart';
import 'package:shivshakti/Services/api_calls.dart';

class GetXBackup extends GetxController{
  ApiCalls calls = ApiCalls();
  RxList<BackupModel> backupData = [BackupModel(scMobile: '', scName: '')].obs;
 Future getBackupApiCall()async{
    backupData.clear();
    await calls.commonApiCallResponse("getBackup.php", {
      "slug": slug,
    }).then((value) {
      // log(value.toString(), name: "getBackupApiCall");
      backupData.value = backupModelFromJson(jsonEncode(jsonDecode(value)['DATA']));
    });
  }
  @override
  void onInit() {
    super.onInit();
    getBackupApiCall();
  }
}