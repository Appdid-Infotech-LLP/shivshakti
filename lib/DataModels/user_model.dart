// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.aId,
    this.aName,
    this.aMobile,
    this.aEmail,
    this.aAadhaarCard,
    this.aAccountId,
    this.aPassword,
    this.aOtp,
    this.aIsBlocked,
    this.aIsDeleted,
    this.aDeviceId,
    this.aIsApproved,
    this.aIsSink,
    this.aDate,
    this.aTime,
  });

  String? aId;
  String? aName;
  String? aMobile;
  String? aEmail;
  String? aAadhaarCard;
  String? aAccountId;
  String? aPassword;
  String? aOtp;
  String? aIsBlocked;
  String? aIsDeleted;
  String? aDeviceId;
  String? aIsApproved;
  String? aIsSink;
  DateTime? aDate;
  String? aTime;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    aId: json["a_id"],
    aName: json["a_name"],
    aMobile: json["a_mobile"],
    aEmail: json["a_email"],
    aAadhaarCard: json["a_aadhaar_card"],
    aAccountId: json["a_account_id"],
    aPassword: json["a_password"],
    aOtp: json["a_otp"],
    aIsBlocked: json["a_is_blocked"],
    aIsDeleted: json["a_is_deleted"],
    aDeviceId: json["a_device_id"],
    aIsApproved: json["a_is_approved"],
    aIsSink: json["a_is_sink"],
    aDate: DateTime.parse(json["a_date"]),
    aTime: json["a_time"],
  );

  Map<String, dynamic> toJson() => {
    "a_id": aId,
    "a_name": aName,
    "a_mobile": aMobile,
    "a_email": aEmail,
    "a_aadhaar_card": aAadhaarCard,
    "a_account_id": aAccountId,
    "a_password": aPassword,
    "a_otp": aOtp,
    "a_is_blocked": aIsBlocked,
    "a_is_deleted": aIsDeleted,
    "a_device_id": aDeviceId,
    "a_is_approved": aIsApproved,
    "a_is_sink": aIsSink,
    "a_date": "${aDate!.year.toString().padLeft(4, '0')}-${aDate!.month.toString().padLeft(2, '0')}-${aDate!.day.toString().padLeft(2, '0')}",
    "a_time": aTime,
  };
}
