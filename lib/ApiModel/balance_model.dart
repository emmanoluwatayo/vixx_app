

// To parse this JSON data, do
//
//     final balance = balanceFromJson(jsonString);

import 'dart:convert';

class Data {
  Data({
    required this.balance,
    required this.totalCredit,
    required this.totalDebit,
    required this.team,
    required this.rank,
    required this.personalSales,
    required this.directSales,
    required this.teamSales,
  });

  String balance;
  String totalCredit;
  String totalDebit;
  String team;
  String rank;
  String personalSales;
  String directSales;
  String teamSales;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    balance: json["balance"],
    totalCredit: json["total_credit"],
    totalDebit: json["total_debit"],
    team: json["team"],
    rank: json["rank"],
    personalSales: json["personal_sales"],
    directSales: json["direct_sales"],
    teamSales: json["team_sales"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "total_credit": totalCredit,
    "total_debit": totalDebit,
    "team": team,
    "rank": rank,
    "personal_sales": personalSales,
    "direct_sales": directSales,
    "team_sales": teamSales,
  };
}
