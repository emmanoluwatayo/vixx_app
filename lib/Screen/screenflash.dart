import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Walkthrough/onboard.dart';
import 'package:vixx_app/Screen/login.dart';

class  AccountCreated extends StatefulWidget{
  @override
  AccountCreatedState createState() =>  AccountCreatedState();
}

class  AccountCreatedState extends State <AccountCreated> with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = new Duration(seconds: 12);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => OnBoardingPage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 180,),
                Image.asset("assets/images/medal.png"),
                SizedBox(height: 45,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child:    LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ColorConstant.primaryColor),
                    backgroundColor: ColorConstant.lightGreyColor,
                  ),
                ),
                SizedBox(height: 20,),
                Text("LOADING....", style: setStyleContent(context,Colors.black,20,FontWeight.bold),textAlign: TextAlign.center,),
                SizedBox(height: 5,),
                Text("All set now! Preparing your account \n in a bit" , style: setStyleContent(context,Colors.black,13,FontWeight.normal),textAlign: TextAlign.center,),
              ],
            ),
          ),
        )

      ),
    );
  }
}