

class RegistrationModel {
  String status;
  String code;
  String description;
  User data;

  RegistrationModel({this.status, this.code, this.description, this.data});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['statusCode'];
    description = json['description'];
    data = User.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['description'] = this.description;
    data['data'] = this.data;
    return data;
  }
}


class User  {
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

  User (
      {
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

  User .fromJson(Map<String, dynamic> responseData) {
    apiKey = responseData['api_key'];
    firstname = responseData['firstname'];
    lastname = responseData['lastname'];
    username = responseData['username'];
    country = responseData['country'];
    state = responseData['state'];
    city = responseData['city'];
    date = responseData['date'];
    email = responseData['email'];
    phone = responseData['phone'];
    status = responseData['status'];
  }
}
