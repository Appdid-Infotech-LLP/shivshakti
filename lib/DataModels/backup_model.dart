// To parse this JSON data, do
//
//     final backupModel = backupModelFromJson(jsonString);

import 'dart:convert';

List<BackupModel> backupModelFromJson(String str) => List<BackupModel>.from(json.decode(str).map((x) => BackupModel.fromJson(x)));

String backupModelToJson(List<BackupModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BackupModel {
  BackupModel({
    required this.scName,
    required this.scMobile,
  });

  String scName;
  String scMobile;

  factory BackupModel.fromJson(Map<String, dynamic> json) => BackupModel(
    scName: json["sc_name"],
    scMobile: json["sc_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "sc_name": scName,
    "sc_mobile": scMobile,
  };
}
