import 'package:get/get.dart';
import 'package:shivshakti/DataModels/extras_model.dart';
import 'package:shivshakti/Services/api_calls.dart';

class GetXExtras extends GetxController{
  ApiCalls calls = ApiCalls();
  Rx<ExtrasModel> extras = ExtrasModel(rateUs: '', contactUsMoblie: '', privacyPolicy: '', contactUsMail: '', aboutUsDesc: '').obs;
  Future getExtras()async{
    await calls.commonApiCallResponse("extras.php", {
     "slug": slug,
    }).then((value) {
      extras.value = extrasModelFromJson(value);
    });
  }

  @override
  void onInit() {
    super.onInit();
    getExtras();
  }
}