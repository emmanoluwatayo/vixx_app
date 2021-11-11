

class RegistrationModel {
  String status;
  String code;
  String description;
  Data data;

  RegistrationModel({this.status, this.code, this.description, this.data});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    description = json['description'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['description'] = this.description;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String sn;
  String apiKey;
  String firstname;
  String lastname;
  String username;
  Null country;
  Null state;
  Null city;
  String date;
  String email;
  String phone;
  String status;

  Data(
      {this.sn,
        this.apiKey,
        this.firstname,
        this.lastname,
        this.username,
        this.country,
        this.state,
        this.city,
        this.date,
        this.email,
        this.phone,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    sn = json['sn'];
    apiKey = json['api_key'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    date = json['date'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sn'] = this.sn;
    data['api_key'] = this.apiKey;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['username'] = this.username;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['date'] = this.date;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['status'] = this.status;
    return data;
  }
}
