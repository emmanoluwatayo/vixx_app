

// To parse this JSON data, do
//
//     final deposit = depositFromJson(jsonString);

import 'dart:convert';

Deposit depositFromJson(String str) => Deposit.fromJson(json.decode(str));

String depositToJson(Deposit data) => json.encode(data.toJson());

class Deposit {
  Deposit({
    required this.status,
    required this.code,
    required this.description,
    required this.page,
    required this.all,
    this.data,
  });

  String status;
  String code;
  String description;
  String page;
  int all;
  dynamic data;

  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
    status: json["status"],
    code: json["code"],
    description: json["description"],
    page: json["page"],
    all: json["all"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "description": description,
    "page": page,
    "all": all,
    "data": data,
  };
}
