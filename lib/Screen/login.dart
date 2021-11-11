// ignore_for_file: unnecessary_statements, avoid_init_to_null

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';
import 'package:vixx_app/Screen/HomeScreen/homesdreen.dart';
import 'package:vixx_app/Screen/Password/recoverpassword.dart';
import 'package:vixx_app/Screen/registration.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';


class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State <LoginPage>{
  bool hidePassword = true;
  bool isLoading = false;
  String username, password;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:  20.0,),
                Text('Log in', style: setStyleContent(context,Colors.black,40,FontWeight.bold) ),
                SizedBox(height:  12.0,),
                Text('Enter your email and password \nto log into your account',  style: setStyleContent(context,Colors.black,20,FontWeight.normal),),
                SizedBox(height:  30.0,),
                Form(
                  key: globalFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Username', style: setStyleContent(context,Colors.black,18,FontWeight.bold) ),
                      TextFormField(
                        controller: usernameController,
                        onSaved: (val) {
                          username = val;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter here',
                          hintStyle: setStyleContent(context,Colors.black, 10,FontWeight.w300),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.person, color: ColorConstant.primaryColor,),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: ColorConstant.primaryColor, width: 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text('Password', style: setStyleContent(context,Colors.black,18,FontWeight.bold) ),
                      TextFormField(
                        obscureText: hidePassword,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        onSaved: (val) {
                          password = val;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter correct pasword';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hoverColor: Colors.deepPurpleAccent,
                          hintText: 'Enter here',
                          hintStyle: setStyleContent(context,Colors.black,10,FontWeight.w300),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.lock, color: ColorConstant.primaryColor,),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(color: ColorConstant.primaryColor, width: 1.0),
                          ),
                          suffixIcon: GestureDetector(
                            child: Icon(hidePassword? Icons.visibility_off: Icons.visibility, color: ColorConstant.black,),
                            onTap: (){
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height:  10.0,),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child:  GestureDetector(
                    child:  Text('Forgot password?', style: setStyleContent(context,ColorConstant.primaryColor, 15,FontWeight.normal),),

                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => PasswordRecover()));
                    },
                  ),
                ),
                SizedBox(height: 30,),
                AppButton(text: "Login",  onPressed: () async{
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(child: CircularProgressIndicator(
                          color: ColorConstant.primaryColor,
                        ),);
                      });
                  await loginAction();
                  if (globalFormKey.currentState .validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data'), duration: const Duration(seconds: 2),),
                    );
                  }
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('username', 'username');
                  login(usernameController.text,passwordController.text);
                },),
                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 250,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Don\'t have an account?', style: setStyleContent(context,Colors.black, 15,FontWeight.w300),),
                        GestureDetector(
                          child:  Text('Register', style: setStyleContent(context,ColorConstant.primaryColor, 15,FontWeight.w500),),

                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationPage()));
                          },
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    print(username);
    runApp(MaterialApp(home: username == null ? BottomNavBar() : LoginPage()));
  }


  Future<bool> loginAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }



  login(username,password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'username': username,
      'password': password,
    };
    print(data);
    String body = json.encode(data);
     String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        headers: {
          "Content-Type": "application/json",
          "Operation": "login"
        },
        body: body,
        encoding: Encoding.getByName("utf-8")
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        // Navigator used to enter inside app if the authentication is correct
        if (globalFormKey.currentState .validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful'),  duration: const Duration(seconds: 3),),

          );
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => BottomNavBar(),
              ),
                  (Route<dynamic> route) => true);
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Username and Password is not correct'),),);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ),
                  (Route<dynamic> route) => true);
        }


      } else {
      setState(() {
        isLoading = false;
      });
      print(response.body);
    }
  }
}
