

import 'dart:convert';
import 'package:vixx_app/utility/postrequest.dart';



const commonUrl = 'https://thevix.club/apimaster.php';

class SendData {
  var error;

  Future<dynamic> register(firstname, lastname, email, username, password, sponsor, phone) async {
    var storage = LocalStorag().storage;
    final email = storage.getItem('email') != null
        ? storage.getItem('email')
        : null;
    var body = {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'username': username,
      'password': password,
      'sponsor': sponsor,
      'phone': phone,
    };

    PostRequest postrequest =
    PostRequest(Uri.https(commonUrl, '/signup'), body);
    var userDetails = await postrequest.postData();
    error = await postrequest.error;
    return userDetails;
  }

  Future<dynamic> login(username, password) async {
    var body = {
      "username": username,
      "password": password,
    };

    Uri url = Uri.https(commonUrl, '/login');

    PostRequest postrequest = PostRequest(url, body);
    var userDetails = await postrequest.postData();
    error = await postrequest.error;
    return userDetails;
  }
}