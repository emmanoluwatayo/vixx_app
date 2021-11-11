import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Password/verify_phone.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';

class PhoneVerificationIndexScreen extends StatefulWidget{
  @override
  _PhoneVerificationIndexScreenState createState() => _PhoneVerificationIndexScreenState();
}

class _PhoneVerificationIndexScreenState extends State <PhoneVerificationIndexScreen>{
  GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Phone Number', style: setStyleContent(context,Colors.black,18,FontWeight.bold),),
                SizedBox(height:ScreenUtil().setHeight(4.0)),
                Text("Let's start with your phone number, you will need this to access your account",  style: setStyleContent(context,Colors.black,12,FontWeight.normal)),
                SizedBox(height:ScreenUtil().setHeight(75.0)),
                Text("Phone Number",  style: setStyleContent(context,Colors.black,12,FontWeight.bold)),
                Form(
                  key: _formKey,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: setStyleContent(context,Colors.black,12,FontWeight.w300),
                      hintText: 'Enter here ',
                      hintStyle: setStyleContent(context,Colors.black, 10,FontWeight.w300),
                      prefixIcon: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset('assets/images/nigeria.png',height: 20,width: 20,),),
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
                ),
                SizedBox(height:ScreenUtil().setHeight(20.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}