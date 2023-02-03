// To parse this JSON data, do
//
//     final extrasModel = extrasModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ExtrasModel extrasModelFromJson(String str) => ExtrasModel.fromJson(json.decode(str));

String extrasModelToJson(ExtrasModel data) => json.encode(data.toJson());

class ExtrasModel {
  ExtrasModel({
    required this.aboutUsDesc,
    required this.rateUs,
    required this.privacyPolicy,
    required this.contactUsMoblie,
    required this.contactUsMail,
  });

  String aboutUsDesc;
  String rateUs;
  String privacyPolicy;
  String contactUsMoblie;
  String contactUsMail;

  factory ExtrasModel.fromJson(Map<String, dynamic> json) => ExtrasModel(
    aboutUsDesc: json["about_us_desc"],
    rateUs: json["rate_us"],
    privacyPolicy: json["privacy_policy"],
    contactUsMoblie: json["contact_us_moblie"],
    contactUsMail: json["contact_us_mail"],
  );

  Map<String, dynamic> toJson() => {
    "about_us_desc": aboutUsDesc,
    "rate_us": rateUs,
    "privacy_policy": privacyPolicy,
    "contact_us_moblie": contactUsMoblie,
    "contact_us_mail": contactUsMail,
  };
}
