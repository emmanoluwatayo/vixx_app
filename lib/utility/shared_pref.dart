

import 'package:shared_preferences/shared_preferences.dart';

createData(String username) async{
  SharedPreferences sPref = await SharedPreferences.getInstance();
  sPref.setString("Username", username);
  print("data stored!");
}

getData() async{
  SharedPreferences sPref = await SharedPreferences.getInstance();
  String firstname = sPref.getString("Username")?? "no username";
  print("The Username is $firstname \n thank you");
}

clearData() async{
  SharedPreferences sPref = await SharedPreferences.getInstance();
  sPref.clear();
  print("data cleared");
}


