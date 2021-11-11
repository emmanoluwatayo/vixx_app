



import 'package:shared_preferences/shared_preferences.dart';
import 'package:vixx_app/Model/signup_model.dart';

class UserPreferences {

  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('sn',user.sn);
    prefs.setString('apiKey',user.apiKey);
    prefs.setString('firstname',user.firstname);
    prefs.setString('lastname',user.lastname);
    prefs.setString('username',user.username);
    prefs.setString('country',user.country);
    prefs.setString('state',user.state);
    prefs.setString('city',user.city);
    prefs.setString('date',user.date);
    prefs.setString('email',user.email);
    prefs.setString('phone',user.phone);
    prefs.setString('status',user.status);


    return prefs.commit();

  }

  Future<User> getUser ()  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String sn = prefs.getString("sn");
    String apiKey = prefs.getString("apiKey");
    String firstname = prefs.getString("firstname");
    String lastname = prefs.getString("lastname");
    String username = prefs.getString("username");
    String country = prefs.getString("country");
    String state = prefs.getString("state");
    String city = prefs.getString("city");
    String date = prefs.getString("date");
    String email = prefs.getString("email");
    String phone = prefs.getString("phone");
    String status = prefs.getString("status");


    return User(

      apiKey: apiKey,
      firstname: firstname,
      lastname: lastname,
      username: username,
      country: country,
      state: state,
      city: city,
      date: date,
      email: email,
      phone: phone,
      status: status,
    );

  }

  void removeUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('sn');
    prefs.remove('apiKey');
    prefs.remove('firstname');
    prefs.remove('lastname');
    prefs.remove('username');
    prefs.remove('country');
    prefs.remove('state');
    prefs.remove('city');
    prefs.remove('date');
    prefs.remove('email');
    prefs.remove('phone');
    prefs.remove('status');

  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiKey = prefs.getString("apiKey");
    return apiKey;
  }

}