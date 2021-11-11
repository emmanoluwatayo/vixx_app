// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Password/recoverpassword.dart';
import 'package:vixx_app/Screen/login.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';


class RegistrationPage extends StatefulWidget{
  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State <RegistrationPage>{

  Timer? timer;
  bool hidePassword2 = true;
  bool hidePassword = true;
  bool isLoading=false;
  String? firstname, lastname, email, username, password, confirmpassword, sponsor, phone;
  final TextEditingController firstnameController = new TextEditingController();
  final TextEditingController lastnameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpasswordController = new TextEditingController();
  final TextEditingController sponsorController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
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
                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back_sharp, size: 25,),
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    // GestureDetector(
                    //   child:  Icon(Icons.person_outline_sharp),
                    //   onTap: (){
                    //     Navigator.push(context,MaterialPageRoute(builder: (context) => AccountInformation()));
                    //   },
                    // ),
                  ],
                ),
                SizedBox(height:  5.0,),
                Text('Register', style: setStyleContent(context,Colors.black,25,FontWeight.bold) ),
                SizedBox(height:  5.0,),
                Text('Enter your email and password \nto register',  style: setStyleContent(context,Colors.black,13,FontWeight.normal),),
                SizedBox(height:  30.0,),
                Form(
                  key: globalFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: firstnameController,
                        onSaved: (val) {
                           firstname = val!;
                        },
                        validator: (value) {
                          if (value!.length < 3) {
                            return 'Firstname is invalid';
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
                      Text('Last Name', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: lastnameController,
                        onSaved: (val) {
                          lastname = val!;
                        },
                        validator: (value) {
                          if (value!.length < 3) {
                            return 'Lastname is invalid';
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
                      Text('Email', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        onSaved: (val) {
                          email = val!;
                        },
                        validator: (val) => EmailValidator.validate(val!) ? null : "Please enter a valid email",
                        decoration: InputDecoration(
                          hintText: 'Enter here',
                          hintStyle: setStyleContent(context,Colors.black, 10,FontWeight.w300),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.mail, color: ColorConstant.primaryColor,),
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
                      Text('Username', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: usernameController,
                        onSaved: (val) {
                          username = val!;
                        },
                        validator: (value) {
                          if (value!.length < 3) {
                            return 'Invalid username';
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
                      Text('Referral', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: sponsorController,
                        onSaved: (val) {
                          sponsor = val!;
                        },
                        decoration: InputDecoration(
                          hoverColor: Colors.deepPurpleAccent,
                          hintText: 'Enter here',
                          hintStyle: setStyleContent(context,Colors.black,10,FontWeight.w300),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.person_add_alt_1, color: ColorConstant.primaryColor,),
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
                      Text('Phone Number', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        onSaved: (val) {
                          phone = val!;
                        },
                        validator: (value) {
                          if  (value!.length != 11) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hoverColor: Colors.deepPurpleAccent,
                          hintText: 'Enter here',
                          hintStyle: setStyleContent(context,Colors.black,10,FontWeight.w300),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.call, color: ColorConstant.primaryColor,),
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
                      Text('Password', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                      TextFormField(
                        obscureText: hidePassword,
                        controller: passwordController,
                        onSaved: (val) {
                          password = val!;
                        },
                        validator: (value) {
                          if  (value!.isEmpty) {
                            return 'Password must be more than 4 characters';
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
                      SizedBox(height: 20.0),
                      Text('Confirm password', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                      TextFormField(
                        obscureText: hidePassword2,
                        controller: confirmpasswordController,
                        onSaved: (val) {
                          password = val!;
                        },
                        validator: (value) {
                          if  (value!.isEmpty) {
                            return 'Password must be more than 4 characters';
                          }
                          if(passwordController.text != confirmpasswordController.text)
                          {
                            return "Password Do not match";
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
                            child: Icon(hidePassword2? Icons.visibility_off: Icons.visibility, color: ColorConstant.black,),
                            onTap: (){
                              setState(() {
                                hidePassword2 = !hidePassword2;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height:  10.0,),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                AppButton(text: "Register", onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) { timer = Timer(Duration(seconds: 4), () {
                          Navigator.pop(context);
                        });
                        return Center(child: CircularProgressIndicator(),);
                        }).then((val){
                      if (timer!.isActive) {
                        timer!.cancel();
                      }
                    });
                  await RegisterAction();
                  if (globalFormKey.currentState! .validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data'), duration: const Duration(seconds: 2),),
                    );
                  }
                  register(firstnameController.text, lastnameController.text, emailController.text, usernameController.text, passwordController.text, sponsorController.text, phoneController.text);
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
                        Text('Already have an account?', style: setStyleContent(context,Colors.black, 15,FontWeight.w300),),
                        GestureDetector(
                          child:  Text('Login', style: setStyleContent(context,ColorConstant.primaryColor, 15,FontWeight.w500),),

                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
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


  Future<bool> RegisterAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future register(  String firstname, lastname, email, username, password, sponsor, phone) async{
    Map data = {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'username': username,
      'password': password,
      'sponsor': sponsor,
      'phone': phone,
    };
    print(data);
    var jsonResponse = null;
    String body = json.encode(data);
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Operation": "signup",
      }
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200)
      jsonResponse = json.decode(response.body);
      if(jsonResponse['status'] == 'success'){
        setState(() {
          isLoading = false;
        });
        if (globalFormKey.currentState! .validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful'),  duration: const Duration(seconds: 3),),
          );
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
          print(jsonResponse);
        }
      }
      else {
        setState(() {
          isLoading = false;
        });
        print("The error message is: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email or Username already exist'),
              duration: const Duration(seconds: 2),));
      }
    }
  }