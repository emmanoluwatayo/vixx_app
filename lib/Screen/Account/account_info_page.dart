import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';
import 'package:vixx_app/Screen/login.dart';
import 'package:vixx_app/Screen/verify_email.dart';

class AccountInformation extends StatefulWidget{
  @override
  AccountInformationState createState() => AccountInformationState();
}

class AccountInformationState extends State <AccountInformation>{

  String  lastname = '0';
  String   firstname ='0';
  String  email = '0';
  String  phonenumber = '0';
  Timer? timer;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  var prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
    reademail();
    readfirstname();
    readphonenumber();
  }


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
              crossAxisAlignment: CrossAxisAlignment.center,
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

                  ],
                ),
                SizedBox(height: 30,),
                Text("Account information", style: setStyleContent(context,ColorConstant.primaryColor,25,FontWeight.bold)),
                SizedBox(height: 20,),
                CircleAvatar(
                  radius: 100,
                  backgroundColor: ColorConstant.lightGreyColor,
                  child: new Image.asset('assets/icons/avatar.png', height: 100, color: ColorConstant.primaryColor,) //For Image Asset
                ),
                SizedBox(height: 15,),
                Text("$firstname $lastname", style: setStyleContent(context,ColorConstant.primaryColor,18,FontWeight.bold)),
                SizedBox(height: 5,),
                GestureDetector(
                  child:  Center(
                      child: Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12), color: ColorConstant.primaryColor),
                        child: Center(
                          child: Text("$phonenumber", style: setStyleContent(context, ColorConstant.slightWhiteColor, 18, FontWeight.bold),),
                        ),
                      )
                  ),
                ),
                SizedBox(height: 5,),
                Text("$email", style: setStyleContent(context,ColorConstant.primaryColor,14,FontWeight.bold)),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  width: 240,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32), ),
                  child:  Divider(thickness: 3,)
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child:  Center(
                      child: Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12), color: ColorConstant.slightWhiteColor, border: Border.all(color: ColorConstant.primaryColor)),
                        child: Center(
                          child: Text("Change password", style: setStyleContent(context, ColorConstant.primaryColor, 18, FontWeight.bold),),
                        ),
                      )
                  ),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => VerifyEmail()));
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child:  Center(
                      child: Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12), color: ColorConstant.slightWhiteColor, border: Border.all(color: ColorConstant.primaryColor)),
                        child: Center(
                          child: Text("Log Out", style: setStyleContent(context, ColorConstant.primaryColor, 18, FontWeight.bold),),
                        ),
                      )
                  ),
                  onTap: () async{
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          timer = Timer(Duration(seconds: 4), () {
                            Navigator.of(context).pop();
                          });
                          return Center(child: CircularProgressIndicator(
                            color: ColorConstant.primaryColor,
                          ),);
                        }).then((val){
                      if (timer!.isActive) {
                        timer!.cancel();
                      }
                    });
                    await LogoutAction();

                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Log out successful')),
                      );
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                  },
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child:  Center(
                      child: Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12), color: ColorConstant.slightWhiteColor, border: Border.all(color: ColorConstant.primaryColor)),
                        child: Center(
                          child: Text("Contact Us", style: setStyleContent(context, ColorConstant.primaryColor, 18, FontWeight.bold),),
                        ),
                      )
                  ),
                  onTap: (){
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only( topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (builder){
                          return Padding(
                            padding:  MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: 300,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Text("$email", style: setStyleContent(context, ColorConstant.primaryColor, 12, FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 80,
                                    width: 350,
                                    child:  TextFormField(
                                      autofocus: false,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ColorConstant.slightGreyColor,
                                        hoverColor: Colors.deepPurpleAccent,
                                        hintText: 'write your message',
                                        hintStyle: setStyleContent(context,Colors.black,10,FontWeight.normal),
                                        contentPadding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 10.0),
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
                                  SizedBox(height: 15,),
                                  GestureDetector(
                                    child:  Center(
                                        child: Container(
                                          height: 40,
                                          width: 280,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8), color: ColorConstant.primaryColor),
                                          child: Center(
                                            child: Text("Send", style: setStyleContent(context, ColorConstant.slightWhiteColor, 12, FontWeight.bold),),
                                          ),
                                        )
                                    ),
                                    onTap: () async{
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            timer = Timer(Duration(seconds: 4), () {
                                              Navigator.of(context).pop();
                                            });
                                            return Center(child: CircularProgressIndicator(
                                              color: ColorConstant.primaryColor,
                                            ),);
                                          }).then((val){
                                        if (timer!.isActive) {
                                          timer!.cancel();
                                        }
                                      });
                                      await LogoutAction();
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavBar()));
                                    },
                                  ),
                                ],
                              ),
                            ),

                          );
                        }
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("lastname",) == null)
      setState(() => lastname = '0',);
    else
      setState(() => lastname = prefs.getString("lastname")!);
  }

  readfirstname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("firstname",) == null)
      setState(() => firstname = '0',);
    else
      setState(() => firstname = prefs.getString("firstname")!);
  }

  readphonenumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("phonenumber",) == null)
      setState(() => phonenumber = '0',);
    else
      setState(() => phonenumber = prefs.getString("phonenumber")!);
  }

  reademail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("email",) == null)
      setState(() => email = '0',);
    else
      setState(() => email = prefs.getString("email")!);
  }

  Future<bool> LogoutAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }
}