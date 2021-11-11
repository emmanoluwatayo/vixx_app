// ignore_for_file: non_constant_identifier_names, avoid_init_to_null

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Password/create_new_password.dart';
import 'package:vixx_app/Screen/login.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';

class VerifyEmail extends StatefulWidget{
  @override
  VerifyEmailState createState() => VerifyEmailState();
}

class VerifyEmailState extends State <VerifyEmail>{

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Timer? timer;

  bool isLoading=false;

  String? email, code;
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                Text('Verify Your Email', style: setStyleContent(context,Colors.black,25,FontWeight.bold),),
                Text('We have sent a verification\ncode to your email',  style: setStyleContent(context,Colors.black,13,FontWeight.normal),),
                SizedBox(height:ScreenUtil().setHeight(60.0)),
                Text('Email',  style: setStyleContent(context,Colors.black,18,FontWeight.bold),),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onSaved: (val) {
                    email = val!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
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
                SizedBox(height: 15,),
                Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: ColorConstant.primaryColor, fontWeight: FontWeight.bold,),
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        onSaved:  (val) {
                          email = val!;
                        },
                        validator: (v) {
                          if (v!.length < 3) {
                            return "Input the otp sent to your mail";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeColor: ColorConstant.primaryColor,
                          inactiveFillColor: ColorConstant.slightGreyColor,
                          inactiveColor: ColorConstant.primaryColor,
                          selectedColor: ColorConstant.primaryColor,
                          selectedFillColor: ColorConstant.slightGreyColor,
                          activeFillColor: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: codeController,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                hasError ? "*Please fill up all the cells properly" : "",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the code? ",
                    style: setStyleContent(context,Colors.black,15,FontWeight.normal),
                ),
                TextButton(
                    onPressed: () => snackBar("OTP resend!!"),
                    child: Text(
                      "RESEND",
                      style: setStyleContent(context,ColorConstant.primaryColor,16,FontWeight.bold),
                    ))
              ],
            ),
                SizedBox(height:ScreenUtil().setHeight(20.0)),
                AppButton(text: "Verify", onPressed: () async{
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
                  await VerifyAction();
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data'), duration: const Duration(seconds: 2),),
                    );
                    verifycode(emailController.text, codeController.text);

                },)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> VerifyAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }


  verifycode(String email, code) async{
    Map data ={
      'email': email,
      'code': code
    };
    print(data);
    var jsonResponse = null;
    String body = json.encode(data);
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Operation": "password_confirm",
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

        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Otp confirm successfully'),  duration: const Duration(seconds: 3),),

        );

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => CreatePassword(),
          ),
              (Route<dynamic> route) => false);
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.body.toString());
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your mail or valid otp'),  duration: const Duration(seconds: 3),));

    }
  }
}

