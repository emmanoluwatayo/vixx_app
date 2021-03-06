// ignore_for_file: avoid_init_to_null

import 'dart:async';
import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/login.dart';
import 'package:vixx_app/Screen/verify_email.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';

class PasswordRecover extends StatefulWidget{
  @override
  PasswordRecoverState createState() => PasswordRecoverState();
}

class PasswordRecoverState extends State <PasswordRecover>{

  Timer? timer;
  String? email;
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin:  EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover,
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
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
                    Text('Recover Password', style: setStyleContent(context,Colors.black,25,FontWeight.bold),),
                    Text('Don\'t worry happens to the\nbest of us',  style: setStyleContent(context,Colors.black,13,FontWeight.normal),),
                    SizedBox(height:ScreenUtil().setHeight(56.0)),
                    Form(
                        key: globalFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email',  style: setStyleContent(context,Colors.black,18,FontWeight.bold),),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              onSaved: (val) {
                                email = val;
                              },
                              validator: (val) => EmailValidator.validate(val!) ? null : "Please enter a valid email",
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: setStyleContent(context,Colors.black,12,FontWeight.w300),
                                hintText: 'Enter here',
                                hintStyle: setStyleContent(context,Colors.black, 10,FontWeight.w300),
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: ColorConstant.primaryColor, width: 1.0),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    SizedBox(height:ScreenUtil().setHeight(20.0)),
                    AppButton(text: 'Next',
                    onPressed: () async{
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
                      await RecoverAction();
                      if (globalFormKey.currentState! .validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data'), duration: const Duration(seconds: 2),),
                        );
                      }
                      resetpassword( emailController.text, );
                    },),
                  ],
                ),
              ),
            )
        )
    );
  }

  Future<bool> RecoverAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }

  resetpassword(String email) async{
    Map data ={
      'email': email,
    };
    print(data);
    var jsonResponse = null;
    String body = json.encode(data);
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Operation": "password_reset",
        }
    );
    print(response.body);
    print(response.statusCode);
    if(response.statusCode == 200)
      jsonResponse = json.decode(response.body);
      if(jsonResponse['status'] == 'success'){
        setState(() {
          isLoading = false;
        });
        // Navigator used to enter inside app if the authentication is correct
        if (globalFormKey.currentState! .validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Otp sent successfully'),  duration: const Duration(seconds: 3),),

          );
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => VerifyEmail(),
              ),
                  (Route<dynamic> route) => false);
        }
      } else {
        setState(() {
          isLoading = false;
        });
        print(response.body.toString());
      }
    }
  }