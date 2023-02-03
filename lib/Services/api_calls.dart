import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

String baseUrl = "https://shivshaktiapp.in/shivshaktinew/API/";
// String baseUrl = "https://levegujar.com/shivshaktinew/API/";
String slug = "zxcvbnm";

class ApiCalls {
  Future<dynamic> commonApiCallResponse(
      String urlR, Map<String, dynamic> body) async {
    String url = baseUrl + urlR;
    try {
      return await post(Uri.parse(url), body: body).then((response) {
        log("$urlR------------>>>>>>${response.statusCode}<----response---->",
            time: DateTime.now());
        if (response.statusCode == 200) {
          log(response.body.toString());
          return (response.body);
        } else {
          return "[]";
        }
      });
    } catch (e) {
      log('$urlR-Error catching data', name: e.toString());
      Fluttertoast.showToast(msg: "Something went wrong !! ");
      return "[]";
    }
  }

  Future<dynamic> commonApiCall(String urlR, Map<String, dynamic> body) async {
    String url = baseUrl + urlR;
    try {
      Response response = await post(Uri.parse(url), body: body);
      log("$urlR------------>>>>>>${response.statusCode}<----json---->",
          time: DateTime.now());
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return "[]";
      }
    } catch (e) {
      log('$urlR-Error catching data----${e.toString()}', error: e.toString());
      Fluttertoast.showToast(msg: "Something went wrong !! ");
      return "[]";
    }
  }

  Future<dynamic> commonApiCallUrl(
      String urlR, Map<String, dynamic> body) async {
    String url = urlR;
    try {
      Response response = await post(Uri.parse(url), body: body);
      // log("$urlR------------>>>>>>${response.statusCode}<----json---->", time: DateTime.now());
      if (response.statusCode == 200) {
        return (response.body);
      } else {
        return "[]";
      }
    } catch (e) {
      log('$urlR-Error catching data----${e.toString()}', error: e.toString());
      Fluttertoast.showToast(msg: "Something went wrong !! ");
      return "[]";
    }
  }
}
