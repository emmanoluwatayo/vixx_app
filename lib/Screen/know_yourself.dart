import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';
import 'package:vixx_app/Widget/ButtonWidget.dart';

import 'HomeScreen/homesdreen.dart';


class KnowYourself extends StatefulWidget{
  @override
  KnowYourselfState createState() => KnowYourselfState();
}

class KnowYourselfState extends State <KnowYourself>{
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:Container(
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
                Text('Kindly Know Yourself', style: setStyleContent(context,Colors.black,15,FontWeight.bold)),
                Text('Please set a password for ur account',   style: setStyleContent(context,Colors.black,12,FontWeight.normal)),
                SizedBox(height:  80.0,),
                Text('First Name',   style: setStyleContent(context,Colors.black,12,FontWeight.bold)),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hoverColor: Colors.deepPurpleAccent,
                    hintText: 'Enter here',
                    hintStyle: setStyleContent(context,Colors.black,10,FontWeight.normal),
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
                Text('Surname',   style: setStyleContent(context,Colors.black,12,FontWeight.bold)),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hoverColor: Colors.deepPurpleAccent,
                    hintText: 'Enter here',
                    hintStyle: setStyleContent(context,Colors.black,10,FontWeight.normal),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DateTimePicker(
                    initialValue: '', // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                    type: DateTimePickerType.date,
                    dateLabelText: 'Select Date',
                    firstDate: DateTime(1995),
                    lastDate: DateTime.now()
                        .add(Duration(days: 365)), // This will add one year from current date
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          selectedDate = value;
                        });
                      }
                    },
                    // We can also use onSave
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Your Selected Date: $selectedDate',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}