import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Account/account_info_page.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';
import 'package:http/http.dart' as http;
import 'package:vixx_app/Screen/Pages/transaction_history.dart';

class InvestPage extends StatefulWidget{
  @override
  InvestPageState createState() => InvestPageState();
}

class InvestPageState extends State <InvestPage>{

  String amount;
  TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  bool isLoading=false;

  String totalBal = "0";

  @override
  void initState() {
    // TODO: implement initState
    displaySummary();
    super.initState();
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
                      child: Icon(Icons.arrow_back_ios_sharp, size: 20,),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavBar()));
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
                Text("Invest", style: setStyleContent(context,ColorConstant.deepGoldColor,25,FontWeight.bold)),
                SizedBox(height: 10,),
                //balance detail page
                GestureDetector(
                  child:  Container(
                    padding: EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: ColorConstant.goldColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Invest", style: setStyleContent(context,ColorConstant.slightWhiteColor,24,FontWeight.bold)),
                            Text("Invest from as low as \n20USDT", style: setStyleContent(context, ColorConstant.slightWhiteColor, 14, FontWeight.w500),),
                            GestureDetector(
                              child:  Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), color: ColorConstant.deepGoldColor
                                ),
                                child: Center(
                                  child: Text("Invest now", style:  setStyleContent(context, ColorConstant.slightWhiteColor, 12, FontWeight.bold),),
                                ),
                              ),
                              onTap: (){
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only( topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25)),
                                    ),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context){
                                      return  Padding(
                                        padding: MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: 300,
                                          padding: EdgeInsets.all(35),
                                          child:  Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("USDT ${totalBal}",style: setStyleContent(context,Colors.black,25,FontWeight.bold)),
                                              Text("Available balance",style: setStyleContent(context,ColorConstant.greenColor,15,FontWeight.w300)),
                                              SizedBox(height: 15,),
                                              Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Amount',style: setStyleContent(context,Colors.black,12,FontWeight.bold)),
                                                    TextFormField(
                                                      keyboardType: TextInputType.text,
                                                      controller: amountController,
                                                      onSaved: (val) {
                                                        amount = val;
                                                      },
                                                      decoration: InputDecoration(
                                                        hoverColor: Colors.deepPurpleAccent,
                                                        labelStyle: setStyleContent(context,Colors.black,20,FontWeight.normal),
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
                                                  ]
                                              ),
                                              SizedBox(height: 10,),
                                              Center(
                                                child:  Text("Get a return of 17% in 12 months",style: setStyleContent(context,ColorConstant.greenColor,15,FontWeight.w300)),
                                              ),
                                              SizedBox(height: 10,),
                                              GestureDetector(
                                                child:  Center(
                                                    child: Container(
                                                      height: 40,
                                                      width: 280,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8), color: ColorConstant.greenColor),
                                                      child: Center(
                                                        child: Text("Proceed", style: setStyleContent(context, ColorConstant.slightWhiteColor, 12, FontWeight.bold),),
                                                      ),
                                                    )
                                                ),
                                                onTap: ()async{
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
                                                                SizedBox(height: 10,),
                                                                Text("You are about to make an investment of",style: setStyleContent(context,ColorConstant.greenColor,15,FontWeight.w300)),
                                                                SizedBox(height: 10,),
                                                                Text("$amount",style: setStyleContent(context,Colors.black,20,FontWeight.bold)),
                                                                SizedBox(height: 10,),
                                                                Text("To get a return of 17% in 12 months",style: setStyleContent(context,ColorConstant.greenColor,15,FontWeight.w300)),
                                                                SizedBox(height: 20,),
                                                                GestureDetector(
                                                                  child:  Center(
                                                                      child: Container(
                                                                        height: 35,
                                                                        width: 280,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(8), color: ColorConstant.greenColor),
                                                                        child: Center(
                                                                          child: Text("Confirm", style: setStyleContent(context, ColorConstant.slightWhiteColor, 12, FontWeight.bold),),
                                                                        ),
                                                                      )
                                                                  ),
                                                                  onTap: () async{
                                                                    showDialog(
                                                                        context: context,
                                                                        builder: (BuildContext context) {
                                                                          return Center(child: CircularProgressIndicator(),);
                                                                        });
                                                                    await investAction();

                                                                      // If the form is valid, display a snackbar. In the real world,
                                                                      // you'd often call a server or save the information in a database.
                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                        const SnackBar(content: Text('Processing Data'), duration: const Duration(seconds: 2),),
                                                                      );
                                                                    investo(amountController.text);
                                                                    // showModalBottomSheet(
                                                                    //     shape: RoundedRectangleBorder(
                                                                    //       borderRadius: BorderRadius.only( topLeft: Radius.circular(25),
                                                                    //           topRight: Radius.circular(25)),
                                                                    //     ),
                                                                    //     context: context,
                                                                    //     builder: (builder){
                                                                    //       return Padding(
                                                                    //         padding:  MediaQuery.of(context).viewInsets,
                                                                    //         child: Container(
                                                                    //           height: 300,
                                                                    //           padding: EdgeInsets.all(20),
                                                                    //           child: Column(
                                                                    //             children: [
                                                                    //               SizedBox(height: 10,),
                                                                    //               Image.asset("assets/images/success.png",height: 100,),
                                                                    //               SizedBox(height: 10,),
                                                                    //               Text("Transaction\n  completed", style: setStyleContent(context, ColorConstant.greenColor, 18, FontWeight.bold),)
                                                                    //             ],
                                                                    //           ),
                                                                    //         ),
                                                                    //
                                                                    //       );
                                                                    //     }
                                                                    // );
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
                                          )
                                        ),
                                      );
                                    }
                                );},
                            ),
                          ],
                        ),
                        Image.asset("assets/images/in_icon.png", height: 55,)
                      ],
                    )
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transaction history", style: setStyleContent(context,ColorConstant.black,18,FontWeight.w600)),
                   GestureDetector(
                     child:  Icon(Icons.arrow_forward_ios_sharp, size: 20,),
                     onTap: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context) => TransactionHistoryPage()));
                     },
                   )
                   // Text("View all", style: setStyleContent(context,ColorConstant.redColor,13,FontWeight.normal))
                      ],
                    ),
                SizedBox(height: 15,),
                Column(
                  children: [
                    GestureDetector(
                      child:  Row(
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
                              child: Image.asset("assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("USDT Withdrawal", style: setStyleContent(context,ColorConstant.black,12,FontWeight.w400)),
                              Text("Successful", style: setStyleContent(context,ColorConstant.greenColor,10,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$3,019.00", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Text("2 days ago", style: setStyleContent(context,ColorConstant.black,10,FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(),
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
                              child: Image.asset("assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("USDT Withdrawal", style: setStyleContent(context,ColorConstant.black,12,FontWeight.w400)),
                              Text("Failed", style: setStyleContent(context,ColorConstant.pinkColor,10,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$7,038", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Text("Sep 27, 2019", style: setStyleContent(context,ColorConstant.black,10,FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    GestureDetector(
                      child:  Row(
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
                              child: Image.asset("assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BTC Withdrawal", style: setStyleContent(context,ColorConstant.black,12,FontWeight.w400)),
                              Text("Failed", style: setStyleContent(context,ColorConstant.pinkColor,10,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$60,337", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Text("Oct 01, 2019", style: setStyleContent(context,ColorConstant.black,10,FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(),
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
                              child: Image.asset("assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BTC Withdrawal", style: setStyleContent(context,ColorConstant.black,12,FontWeight.w400)),
                              Text("Failed", style: setStyleContent(context,ColorConstant.pinkColor,10,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$60,337", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Text("Oct 01, 2019", style: setStyleContent(context,ColorConstant.black,10,FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    GestureDetector(
                      child:  Row(
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
                              child: Image.asset("assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BTC Withdrawal", style: setStyleContent(context,ColorConstant.black,12,FontWeight.w400)),
                              Text("Successful", style: setStyleContent(context,ColorConstant.greenColor,10,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$60,337", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Text("Oct 01, 2019", style: setStyleContent(context,ColorConstant.black,10,FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(),
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
                              child: Image.asset("assets/images/wallet_icon.png", height: 25,),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("USDT Withdrawal", style: setStyleContent(context,ColorConstant.black,12,FontWeight.w400)),
                              Text("Successful", style: setStyleContent(context,ColorConstant.greenColor,10,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("\$60,337", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Text("Oct 15, 2019", style: setStyleContent(context,ColorConstant.black,10,FontWeight.w300))
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

  Future<bool> investAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<void> displaySummary() async {
    Map data = {
      'type': amount,
    };
    print(data);
    String body = json.encode(data);
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        headers: {
          "Content-Type": "application/json",
          "Operation": "summary",
          "Authorization": "hthwijlewivcbeusnwjx6yqldbdi"
        },


        body: body,
        encoding: Encoding.getByName("utf-8")
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body.toString()); // for Printing the token
      var data = response.body;
      var  userAccount = json.decode(data);
      setState(() {
        totalBal = userAccount['data']['balance'];
      });
    } else {
      print('error');
    }
  }

  investo(String amount,) async {
    Map data = {
      'amount': amount,
    };
    print(data);
    String body = json.encode(data);
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        headers: {
          "Content-Type": "application/json",
          "Operation": "invest",
          "Authorization": "hthwijlewivcbeusnwjx6yqldbdi"
        },


        body: body,
        encoding: Encoding.getByName("utf-8")
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      // Navigator used to enter inside app if the authentication is correct
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transaction completed'),  duration: const Duration(seconds: 3),),

      );
      // Navigator used to enter inside app if the authentication is correct
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => BottomNavBar(),
          ),
              (Route<dynamic> route) => false);
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.body.toString());
    }
  }
}