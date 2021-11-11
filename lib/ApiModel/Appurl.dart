
class DepositHistory {
  String status;
  String code;
  String description;
  int page;
  int all;
  List<Data> data;

  DepositHistory(
      {this.status,
        this.code,
        this.description,
        this.page,
        this.all,
        this.data});

  DepositHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    description = json['description'];
    page = json['page'];
    all = json['all'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['description'] = this.description;
    data['page'] = this.page;
    data['all'] = this.all;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String sn;
  String amount;
  String type;
  String status;
  String date;
  String remark;

  Data({this.sn, this.amount, this.type, this.status, this.date, this.remark});

  Data.fromJson(Map<String, dynamic> json) {
    sn = json['sn'];
    amount = json['amount'];
    type = json['type'];
    status = json['status'];
    date = json['date'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sn'] = this.sn;
    data['amount'] = this.amount;
    data['type'] = this.type;
    data['status'] = this.status;
    data['date'] = this.date;
    data['remark'] = this.remark;
    return data;
  }
}
