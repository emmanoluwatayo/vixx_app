// ignore_for_file: missing_return

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Account/account_info_page.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';
import 'package:vixx_app/Screen/HomeScreen/homesdreen.dart';

class TransactionHistoryPage extends StatefulWidget{
  @override
  TransactionHistoryPageState createState() => TransactionHistoryPageState();
}

class TransactionHistoryPageState extends State <TransactionHistoryPage>{

  String totalAmount = "amount", totalDate = "date", remark= "remark";

  Future <List<void>>? futureData;
  String? history, page;

  @override
  void initState() {
    displaySummary();
    super.initState();

  }

  bool isLoading=false;

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
                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back_sharp, size: 25,),
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    GestureDetector(
                      child:  Icon(Icons.person_outline_sharp),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => AccountInformation()));
                      },
                    ),
                  ],
                ),
                Text("Transaction", style: setStyleContent(context,ColorConstant.primaryColor,25,FontWeight.bold)),
                SizedBox(height: 10,),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstant.slightGreyColor,
                    hoverColor: Colors.deepPurpleAccent,
                    hintText: 'Search',
                    hintStyle: setStyleContent(context,Colors.black,10,FontWeight.normal),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    suffixIcon: Icon(Icons.search_sharp),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: ColorConstant.primaryColor, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerRight,
                  child:  GestureDetector(
                    child:  Container(
                      padding: EdgeInsets.all(10.0),
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32), color: ColorConstant.primaryColor
                      ),
                      child: Center(
                        child: Text("VIEW BY DATE", style:  setStyleContent(context, ColorConstant.slightWhiteColor, 12, FontWeight.bold),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transaction history", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w600)),
                    Icon(Icons.arrow_forward_ios_sharp, size: 13,),
                    // Text("View all", style: setStyleContent(context,ColorConstant.redColor,13,FontWeight.normal))
                  ],
                ),
                SizedBox(height: 15,),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 1500.0,
                      child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return     GestureDetector(
                            child:  Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: ColorConstant.primaryColor
                                  ),
                                  child: Center(
                                    child: Image.asset("assets/images/wallet_icon.png", height: 25,),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(" ${remark}", style: setStyleContent(context,ColorConstant.black,12,FontWeight.w400)),
                                    Text("Successful", style: setStyleContent(context,ColorConstant.greenColor,10,FontWeight.w400)),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text("usdt ${totalAmount}", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                                    Text("${totalDate}", style: setStyleContent(context,ColorConstant.black,10,FontWeight.w300))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1,
                            indent: 50,
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> displaySummary() async {
    Map data = {
      'type': history,
    };
    print(data);
    String body = json.encode(data);
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        headers: {
          "Content-Type": "application/json",
          "Operation": "requery",
          "Authorization": "hthwijlewivcbeusnwjx6yqldbdi"
        },


        body: body,
        encoding: Encoding.getByName("utf-8")
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body.toString()); // for Printing the token



    } else {
      print('error');
    }
  }
}