

import 'package:http/http.dart';
import 'dart:convert';

class GetRequestHandler {
  GetRequestHandler(this.url, this.token);

  final Uri url;
  final String token;
  var error;

  Future getData() async {
    try {
      Response response = await get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token"
        },
      );
      String data = response.body;

      var decodedData = jsonDecode(data);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          decodedData['success'] == true) {
        final info = decodedData['success'] == true
            ? json.encode(decodedData)
            : json.encode(null);
        error = null;
        print(info);
        return decodedData;
      } else {
        if (decodedData['success'] != true) {
          error = decodedData['message'];
        }
      }
    } catch (e) {
      error = e;
    }
  }
}
