import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Account/account_info_page.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';
import 'package:vixx_app/Screen/Pages/deposit_page.dart';
import 'package:vixx_app/Screen/Pages/invest_page.dart';
import 'package:vixx_app/Screen/Pages/transaction_history.dart';
import 'package:vixx_app/Screen/Pages/withdrawal_page.dart';
import 'package:vixx_app/Screen/login.dart';

class HomeScreen extends StatefulWidget{


  @override
  HomeScreenState createState() => HomeScreenState();
}


class HomeScreenState extends State  <HomeScreen> {

  SharedPreferences? sharedPreferences;

  String totalAmount = "0",
      totalEarnings = "0",
      accumulatedBal = "0";






    getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("lastname",) == null)
      setState(() => lastname = '0',);
    else
      setState(() => lastname = prefs.getString("lastname")!);
  }

  getfirstname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("firstname",) == null)
      setState(() => firstname = '0',);
    else
      setState(() => firstname = prefs.getString("firstname")!);
  }
String firstname = '0';
String lastname = '0';
  @override
  void initState() {
    // TODO: implement initState
    displaySummary();
    super.initState();
    getData();
    getfirstname();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  String? data;

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hello", style: setStyleContent(
                        context, Colors.black, 15, FontWeight.normal)),
                    GestureDetector(
                      child: Icon(Icons.person_outline_sharp),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => AccountInformation()));
                      },
                    ),
                  ],
                ),
                Text("$firstname $lastname", style: setStyleContent(
                    context, ColorConstant.primaryColor, 15, FontWeight.bold)),
                SizedBox(height: 10,),
                //balance detail page
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Balance", style: setStyleContent(context,
                            ColorConstant.slightWhiteColor, 12,
                            FontWeight.w300)),
                        Text("USDT ${totalAmount}", style: setStyleContent(
                            context, ColorConstant.slightWhiteColor, 25,
                            FontWeight.bold)),
                        SizedBox(height: 11.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Credit", style: setStyleContent(
                                context, ColorConstant.slightWhiteColor, 12,
                                FontWeight.w300)),
                            Text("Total Debit", style: setStyleContent(
                                context, ColorConstant.slightWhiteColor, 12,
                                FontWeight.w300)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("USDT ${totalEarnings}",
                                style: setStyleContent(
                                    context, ColorConstant.slightWhiteColor, 20,
                                    FontWeight.bold)),
                            Text("USDT ${accumulatedBal}",
                                style: setStyleContent(
                                    context, ColorConstant.slightWhiteColor, 20,
                                    FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    color: ColorConstant.slightGreyColor,
                    border: Border.all(color: ColorConstant.primaryColor),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/green_rectangle.png",
                                height: 20,),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Income", style: setStyleContent(
                                      context, ColorConstant.black, 14,
                                      FontWeight.w300),),
                                  Text("usdt ${totalEarnings}", style: setStyleContent(
                                      context, ColorConstant.greenColor, 15,
                                      FontWeight.bold)),
                                ],
                              )
                            ],
                          ),
                          Image.asset("assets/images/div.png", width: 1,
                            color: ColorConstant.primaryColor,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/red_rectangle.png", height: 20,),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Expenses", style: setStyleContent(
                                      context, ColorConstant.black, 14,
                                      FontWeight.w300),),
                                  Text("usdt ${accumulatedBal}", style: setStyleContent(
                                      context, ColorConstant.pinkColor, 15,
                                      FontWeight.bold)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 130.0,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(12),
                            color: ColorConstant.goldColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/in_icon.png", height: 35,),
                              Text("Invest", style: setStyleContent(
                                  context, ColorConstant.slightWhiteColor, 15,
                                  FontWeight.bold)),
                              Text("Invest from as\nlow as 20USDT",
                                  style: setStyleContent(
                                      context, ColorConstant.slightWhiteColor,
                                      10, FontWeight.normal)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => InvestPage()));
                        },
                      ),
                      SizedBox(width: 7,),
                      GestureDetector(
                        child: Container(
                          width: 130.0,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(12),
                            color: ColorConstant.blueColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/in_icon.png", height: 35,),
                              Text("Deposit", style: setStyleContent(
                                  context, ColorConstant.slightWhiteColor, 15,
                                  FontWeight.bold)),
                              Text("Deposit funds as\nlow as 20USDT",
                                  style: setStyleContent(
                                      context, ColorConstant.slightWhiteColor,
                                      10, FontWeight.normal)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DepositPage()));
                        },
                      ),
                      SizedBox(width: 7,),
                      GestureDetector(
                        child: Container(
                          width: 130.0,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(12),
                            color: ColorConstant.pinkColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/with_icon.png", height: 35,),
                              Text("Withdraw", style: setStyleContent(
                                  context, ColorConstant.slightWhiteColor, 15,
                                  FontWeight.bold)),
                              Text("Withdraw funds as\nlow as 20USDT",
                                  style: setStyleContent(
                                      context, ColorConstant.slightWhiteColor,
                                      10, FontWeight.normal)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => WithdrawalPage()));
                        },
                      ),
                      SizedBox(width: 7,),
                      GestureDetector(
                        child: Container(
                          width: 130.0,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(12),
                            color: ColorConstant.slightGreyColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/tran_history.png", height: 35,),
                              Text("Transaction\nHistory",
                                  style: setStyleContent(
                                      context, ColorConstant.primaryColor, 15,
                                      FontWeight.bold)),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TransactionHistoryPage()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Transaction", style: setStyleContent(
                            context, ColorConstant.black, 15, FontWeight.w700)),
                        GestureDetector(
                          child: Text("View all", style: setStyleContent(
                              context, ColorConstant.black, 13,
                              FontWeight.w600)),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    TransactionHistoryPage()));
                          },
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Column(
                  children: [
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstant.pinkColor
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("USDT Withdrawal", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.w400)),
                              Text("Successful", style: setStyleContent(
                                  context, ColorConstant.greenColor, 10,
                                  FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$3,019.00", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.bold)),
                              Text("2 days ago", style: setStyleContent(
                                  context, ColorConstant.black, 10,
                                  FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 2,
                      indent: 50,
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstant.greenColor
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("USDT Withdrawal", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.w400)),
                              Text("Failed", style: setStyleContent(
                                  context, ColorConstant.pinkColor, 10,
                                  FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$7,038", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.bold)),
                              Text("Sep 27, 2019", style: setStyleContent(
                                  context, ColorConstant.black, 10,
                                  FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 2,
                      indent: 50,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstant.pinkColor
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BTC Withdrawal", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.w400)),
                              Text("Failed", style: setStyleContent(
                                  context, ColorConstant.pinkColor, 10,
                                  FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$60,337", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.bold)),
                              Text("Oct 01, 2019", style: setStyleContent(
                                  context, ColorConstant.black, 10,
                                  FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 2,
                      indent: 50,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstant.greenColor
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BTC Withdrawal", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.w400)),
                              Text("Failed", style: setStyleContent(
                                  context, ColorConstant.pinkColor, 10,
                                  FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$60,337", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.bold)),
                              Text("Oct 01, 2019", style: setStyleContent(
                                  context, ColorConstant.black, 10,
                                  FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 2,
                      indent: 50,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstant.pinkColor
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BTC Withdrawal", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.w400)),
                              Text("Successful", style: setStyleContent(
                                  context, ColorConstant.greenColor, 10,
                                  FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$60,337", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.bold)),
                              Text("Oct 01, 2019", style: setStyleContent(
                                  context, ColorConstant.black, 10,
                                  FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 2,
                      indent: 50,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorConstant.greenColor
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("USDT Withdrawal", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.w400)),
                              Text("Successful", style: setStyleContent(
                                  context, ColorConstant.greenColor, 10,
                                  FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$60,337", style: setStyleContent(
                                  context, ColorConstant.black, 12,
                                  FontWeight.bold)),
                              Text("Oct 15, 2019", style: setStyleContent(
                                  context, ColorConstant.black, 10,
                                  FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
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
      'type': null,
    };
    print(data);

    String body = json.encode(data);
    var jsonResponse = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? apikey = prefs.getString("apikey");
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        headers: {
          "Content-Type": "application/json",
          "Operation": "summary",
          "Authorization": "$apikey"
        },


        body: body,
        encoding: Encoding.getByName("utf-8")
    );
    print(response.statusCode);
    if (response.statusCode == 200)
      jsonResponse = json.decode(response.body);
    print(response.body.toString()); // for Printing the token
    if (jsonResponse['status'] == 'success') {
      setState(() {
        totalAmount = jsonResponse['data']['balance'];
        totalEarnings = jsonResponse['data']['total_credit'];
        accumulatedBal = jsonResponse['data']['total_debit'];
      });
    }
    else {
      print('error');
    }
  }

  // getData() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String firstname = prefs.getString("firstname")?? "no firstname";
  //   String lastname = prefs.getString("lastname")?? "no lastname";
  //   String phonenumber = prefs.getString("phonenumber")?? "no phonenumber";
  //   String email = prefs.getString("email")?? "no email";
  //
  //   print("The firstname is $firstname \n thank you");
  //   print("The lastname is $lastname \n thank you");
  //   print("The phonenumber is $phonenumber \n thank you");
  //   print("The email is $email \n thank you");
  // }
}