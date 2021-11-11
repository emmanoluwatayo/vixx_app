


// To parse this JSON data, do
//
//     final invest = investFromJson(jsonString);

import 'dart:convert';

Invest investFromJson(String str) => Invest.fromJson(json.decode(str));

String investToJson(Invest data) => json.encode(data.toJson());

class Invest {
  Invest({
    required this.status,
    required this.code,
    required this.description,
    required this.page,
    required this.all,
    required this.data,
  });

  String status;
  String code;
  String description;
  String page;
  int all;
  List<Datum> data;

  factory Invest.fromJson(Map<String, dynamic> json) => Invest(
    status: json["status"],
    code: json["code"],
    description: json["description"],
    page: json["page"],
    all: json["all"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "description": description,
    "page": page,
    "all": all,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.sn,
    required this.amount,
    required this.type,
    required this.status,
    required this.date,
    required this.remark,
  });

  String sn;
  String amount;
  String type;
  String status;
  DateTime date;
  String remark;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    sn: json["sn"],
    amount: json["amount"],
    type: json["type"],
    status: json["status"],
    date: DateTime.parse(json["date"]),
    remark: json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "sn": sn,
    "amount": amount,
    "type": type,
    "status": status,
    "date": date.toIso8601String(),
    "remark": remark,
  };
}
