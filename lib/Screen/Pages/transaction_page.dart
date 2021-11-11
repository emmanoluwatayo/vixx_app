
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';

class DepositTransactionPage extends StatefulWidget{
  @override
  DepositTransactionPageState createState() => DepositTransactionPageState();
}

class DepositTransactionPageState extends State <DepositTransactionPage>{

  String totalAmount = "amount", totalDate = "date", remark= "remark";

  Future <List<void>>? futureData;
  String? deposit, page;

  @override
  void initState() {
    displaySummary();
    super.initState();

  }

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 700.0,
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 12,
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
                              color: ColorConstant.blueColor
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
      )
    );
  }

  Future<void> displaySummary() async {
    Map data = {
      'type': deposit,
    };
    print(data);
    String body = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? apikey = prefs.getString("apikey");
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        headers: {
          "Content-Type": "application/json",
          "Operation": "requery",
          "Authorization": "$apikey"
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