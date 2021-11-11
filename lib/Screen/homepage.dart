import 'package:flutter/material.dart';
import 'package:vixx_app/Screen/screenflash.dart';



class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State <HomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: AccountCreated(),
    );
  }
}