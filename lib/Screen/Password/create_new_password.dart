import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/login.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';

class CreatePassword extends StatefulWidget{
  @override
  CreatePasswordState createState() => CreatePasswordState();
}

class CreatePasswordState extends State <CreatePassword>{

  bool hidePassword = true;
  bool hidePassword2 =true;

  String email, password;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
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
                Text('Create Password', style: setStyleContent(context,Colors.black,35,FontWeight.bold),),
                Text('Please set a password for u  account',   style: setStyleContent(context,Colors.black,20,FontWeight.normal)),
                SizedBox(height:  80.0,),
                Text('Email',   style: setStyleContent(context,Colors.black,18,FontWeight.bold)),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onSaved: (val) {
                    email = val;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hoverColor: Colors.deepPurpleAccent,
                    labelStyle:  setStyleContent(context,Colors.black,12,FontWeight.normal),
                    hintText: 'Enter here',
                    hintStyle: setStyleContent(context,Colors.black,12,FontWeight.normal),
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
                SizedBox(height: 20,),
                Text('Password',   style: setStyleContent(context,Colors.black,12,FontWeight.bold)),
                TextFormField(
                  obscureText: hidePassword,
                  controller: passwordController,
                  onSaved: (val) {
                    password = val;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid Password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hoverColor: Colors.deepPurpleAccent,
                    labelStyle:   setStyleContent(context,Colors.black,12,FontWeight.normal),
                    hintText: 'Enter here',
                    hintStyle:  setStyleContent(context,Colors.black,12,FontWeight.normal),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                SizedBox(height: 50,),
                AppButton(text: "Confirm", onPressed: () async{
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(child: CircularProgressIndicator(),);
                      });
                  await CreateAction();
                  if (globalFormKey.currentState .validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data'), duration: const Duration(seconds: 2),),
                    );
                  }
                  newpassword(emailController.text, passwordController.text);
                },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> CreateAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }

  newpassword(String email, password) async{
    Map data ={
      'email': email,
      'password': password
    };
    print(data);
    String body = json.encode(data);
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Operation": "password_change",
        }
    );
    print(response.body);
    print(response.statusCode);
    if(response.statusCode == 200){

      setState(() {
        isLoading = false;
      });
      // Navigator used to enter inside app if the authentication is correct
      if (globalFormKey.currentState .validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification Confirm'),  duration: const Duration(seconds: 3),),

        );

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => LoginPage(),
          ),
              (Route<dynamic> route) => false);
      }
    }else {
      setState(() {
        isLoading = false;
      });
      print(response.body.toString());
    }
  }
}