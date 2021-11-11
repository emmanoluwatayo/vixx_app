import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/verify_email.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';

class EmailVerificationIndexScreen extends StatefulWidget{
  @override
  EmailVerificationIndexScreenState createState() => EmailVerificationIndexScreenState();
}

class EmailVerificationIndexScreenState extends State <EmailVerificationIndexScreen>{
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              padding:  EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: setStyleContent(context,Colors.black,15,FontWeight.bold),),
                  SizedBox(height:ScreenUtil().setHeight(4.0)),
                  Text("We will then send a verification code",  style: setStyleContent(context,Colors.black,12,FontWeight.normal)),
                  SizedBox(height:ScreenUtil().setHeight(56.0)),
                  Text('Email', style: setStyleContent(context,Colors.black,12,FontWeight.bold) ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
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
                  SizedBox(height:ScreenUtil().setHeight(20.0)),
                ],
              ),
            ),
          )
      ),
    );
  }
}