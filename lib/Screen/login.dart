// ignore_for_file: unnecessary_statements, avoid_init_to_null

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vixx_app/ApiModel/login_model.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';
import 'package:vixx_app/Screen/HomeScreen/homesdreen.dart';
import 'package:vixx_app/Screen/Password/recoverpassword.dart';
import 'package:vixx_app/Screen/registration.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';
import 'package:vixx_app/utility/senddata.dart';


class LoginPage extends StatefulWidget{
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State <LoginPage> {

  bool isInAsyncCall = false;

  bool isInvalidAsyncUser = false;
  bool isInvalidAsyncPass = false;
  bool isLoggedIn = false;
  Timer? timer;
  var errorMsg;
  bool? isButtonDisabled;
  SendData loginRequest = SendData();
  String? username;
  String? password;
  String? errror;
  bool hidePassword = true;
  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _submit() {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();

      // dismiss keyboard during async call
      FocusScope.of(context).requestFocus(new FocusNode());

      // start the modal progress HUD
      setState(() {
        isInAsyncCall = true;
      });

      // Simulate a service call
      Future.delayed(Duration(seconds: 1), () {
        final accountUsername = usernameController;
        final accountPassword = passwordController;
        setState(() {
          if ( usernameController == accountUsername) {
            isInvalidAsyncUser = false;
            if (passwordController == accountPassword) {
              // username and password are correct
              isInvalidAsyncPass = false;
              isLoggedIn = true;
            } else
              // username is correct, but password is incorrect
              isInvalidAsyncPass = true;
          } else {
            // incorrect username and have not checked password result
            isInvalidAsyncUser = true;
            // no such user, so no need to trigger async password validator
            isInvalidAsyncPass = false;
          }
          // stop the modal progress HUD
          isInAsyncCall = false;
        });
        if (isLoggedIn);
          // do something
        login(usernameController.text, passwordController.text);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isInAsyncCall,
      // demo of some additional parameters
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(),
       child: Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child:
            SingleChildScrollView(
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
                    SizedBox(height: 20.0,),
                    Text('Log in', style: setStyleContent(
                        context, Colors.black, 25, FontWeight.bold)),
                    SizedBox(height: 5.0,),
                    Text('Enter your email and password \nto log into your account',
                      style: setStyleContent(
                          context, Colors.black, 13, FontWeight.normal),),
                    SizedBox(height: 30.0,),
                    Form(
                      key: globalFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Username', style: setStyleContent(
                              context, Colors.black, 18, FontWeight.bold)),
                          TextFormField(
                            controller: usernameController,
                            onSaved: (val) {
                              username = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter here',
                              hintStyle: setStyleContent(context, Colors.black, 12,
                                  FontWeight.w300),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0,
                                  15.0),
                              prefixIcon: Icon(Icons.person,
                                color: ColorConstant.primaryColor,),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                    color: ColorConstant.primaryColor, width: 1.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text('Password', style: setStyleContent(
                              context, Colors.black, 18, FontWeight.bold)),
                          TextFormField(
                            obscureText: hidePassword,
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            onSaved: (val) {
                              password = val;
                            },
                            validator: (value) {
                              if  (value!.isEmpty) {
                                return 'Please enter correct password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hoverColor: Colors.deepPurpleAccent,
                              hintText: 'Enter here',
                              hintStyle: setStyleContent(context, Colors.black, 10,
                                  FontWeight.w300),
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0,
                                  15.0),
                              prefixIcon: Icon(Icons.lock,
                                color: ColorConstant.primaryColor,),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                    color: ColorConstant.primaryColor, width: 1.0),
                              ),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  hidePassword ? Icons.visibility_off : Icons
                                      .visibility, color: ColorConstant.black,),
                                onTap: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: Text('Forgot password?', style: setStyleContent(
                            context, ColorConstant.primaryColor, 15,
                            FontWeight.normal),),

                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => PasswordRecover()));
                        },
                      ),
                    ),
                    SizedBox(height: 30,),
                    AppButton(text: "Login", onPressed:
                       _submit,
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 250,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Don\'t have an account?', style: setStyleContent(
                                context, Colors.black, 15, FontWeight.w300),),
                            GestureDetector(
                              child: Text('Register', style: setStyleContent(
                                  context, ColorConstant.primaryColor, 15,
                                  FontWeight.w500),),

                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => RegistrationPage()));
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
        )
    );

  }


  Future<bool> loginAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }


   login(String username, password) async {
    Map data = {
      'username': username,
      'password': password,
    };
    var jsonResponse = null;
    String body = json.encode(data);
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
      headers: {
        "Content-Type": "application/json",
        "Operation": "login"
      },
      body: body,);



    if(response.statusCode == 200)
      jsonResponse = json.decode(response.body);
print(jsonResponse);



    if(jsonResponse['status'] == 'success'){
      String status = jsonResponse['status'];
      String pesan = jsonResponse['description'];
      String apikey = jsonResponse['data']['api_key'];
      String firstname = jsonResponse['data']['firstname'];
      String lastname = jsonResponse['data']['lastname'];
      String phonenumber = jsonResponse['data']['phone'];
      String email = jsonResponse['data']['email'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('apikey', apikey);
      prefs.setString("firstname", firstname);
      prefs.setString("lastname", lastname);
      prefs.setString("phonenumber", phonenumber);
      prefs.setString("email", email);
      print(prefs.setString("phonenumber", phonenumber));
      setState(() {
        isLoading = false;
      });
      if (globalFormKey.currentState! .validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful'),  duration: const Duration(seconds: 3),),
        );

        pageRoute(jsonResponse['data']['api_key']);

        print(status);
        print(apikey);

      }
    }
    else {
      setState(() {
        isLoading = false;
      });
      print("The error message is: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or Password.'),
            duration: const Duration(seconds: 2),));
    }
  }


  void pageRoute(String api_key) async{
    SharedPreferences sPref = await SharedPreferences.getInstance();
    await sPref.setString("login", api_key);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => BottomNavBar( )), (Route<dynamic> route) => false);
  }

  createData(String apikey,firstname, lastname, phonenumber, email ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('apikey', apikey);
    prefs.setString("firstname", firstname);
    prefs.setString("lastname", lastname);
    prefs.setString("phonenumber", phonenumber);
    prefs.setString("email", email);
    print("data stored!");
  }

  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstname = prefs.getString("firstname")?? "no firstname";
    String lastname = prefs.getString("lastname")?? "no lastname";
    String phonenumber = prefs.getString("phonenumber")?? "no phonenumber";
    String email = prefs.getString("email")?? "no email";

    print("The firstname is $firstname \n thank you");
    print("The lastname is $lastname \n thank you");
    print("The phonenumber is $phonenumber \n thank you");
    print("The email is $email \n thank you");
  }

  clearData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print("data cleared");
  }
}
