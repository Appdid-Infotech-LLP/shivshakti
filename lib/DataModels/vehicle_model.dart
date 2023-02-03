// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);


import 'dart:convert';



List<VehicleModel> vehicleModelFromJson(String str) => List<VehicleModel>.from(json.decode(str).map((x) => VehicleModel.fromJson(x)));

String vehicleModelToJson(List<VehicleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));




class VehicleModel {
  VehicleModel({
    required this.id,
    required this.loanno,
    required this.vehiclenumber,
    required this.customername,
    required this.make,
    required this.financecompanyname,
    required this.entrydate,
    required this.entrytime,
  });
  String id;
  String loanno;
  String vehiclenumber;
  String customername;
  String make;
  String financecompanyname;
  DateTime entrydate;
  String entrytime;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
    id: json["id"],
    loanno: json["loanno"],
    vehiclenumber: json["vehiclenumber"],
    customername: json["customername"],
    make: json["make"],
    financecompanyname: json["financecompanyname"],
    entrydate: DateTime.parse(json["entrydate"]),
    entrytime: json["entrytime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "loanno": loanno,
    "vehiclenumber": vehiclenumber,
    "customername": customername,
    "make": make,
    "financecompanyname": financecompanyname,
    "entrydate": "${entrydate.year.toString().padLeft(4, '0')}-${entrydate.month.toString().padLeft(2, '0')}-${entrydate.day.toString().padLeft(2, '0')}",
    "entrytime": entrytime,
  };
}





