

import 'package:http/http.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';

class PostRequest {
  PostRequest(this.url, this.body);

  final Uri url;
  final headers = {'Content-Type': 'application/json'};
  final Map<String, dynamic> body;
  var error;
  var userDetails;
  Future postData() async {
    try {
      Response response =
      await post(url, headers: headers, body: json.encode(body));
      String data = response.body;

      var decodedData = jsonDecode(data);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          decodedData['status'] == 'success') {
        error = null;
        return decodedData;
      } else {
        if (decodedData['status'] != 'success') {
          error = decodedData['message'];
        }
      }
    } catch (e) {
      error = e;
    }
  }
}

class LocalStorag {
  final LocalStorage storage = new LocalStorage('vix_club');
//final LocalStorage storage2 = new LocalStorage('mizala2');
}

class UserData {
  var userStorage = LocalStorag();
  dynamic getUserData() {
    var storage = userStorage.storage;
    var userData = storage.getItem("userDetails");
    return userData;
  }

  String getName() {
    var storage = userStorage.storage;
    var userData = storage.getItem("userDetails");
    var user = jsonDecode(userData);
    var firstname = user["payload"]["firstname"];
    var lastname = user["payload"]["lastname"];
    return "$firstname $lastname";
  }

  String getId() {
    var storage = userStorage.storage;
    var userData = storage.getItem("userDetails");
    var user = jsonDecode(userData);
    var uid = user["payload"]["sn"];
    return uid;
  }

  String getPhonenumber() {
    var storage = userStorage.storage;
    var userData = storage.getItem("userDetails");
    var user = jsonDecode(userData);
    var phonenumber = user["payload"]["phonenumber"];
    return phonenumber;
  }
}

class CarData {
  var userStorage = LocalStorag();
  dynamic getCarData() {
    var storage = userStorage.storage;
    var carData = storage.getItem("api_key");
    return carData;
  }
}
