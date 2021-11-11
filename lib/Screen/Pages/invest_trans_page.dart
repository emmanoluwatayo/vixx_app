


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vixx_app/ApiModel/invest_requery_model.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';

class InvestTransactionPage extends StatefulWidget{
  @override
  InvestTransactionPageState createState() => InvestTransactionPageState();
}

class InvestTransactionPageState extends State <InvestTransactionPage>{

  String? invest;
  Future <List<Invest>>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchDatum(invest) ;
  }

 //  Future<List<Datum>>? futureData;
 //  Datum? datum;
 // String? invest;
 //  @override
 //  void initState() {
 //    super.initState();
 //    futureData =  fetchDatum(invest) ;
 //  }


  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: SingleChildScrollView(
            child:
            FutureBuilder<List<Datum>>(

                builder: (context, snapshot){
                  if(snapshot.hasData){
                    List<Datum> data = snapshot.data!;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) => Container(
                          child:  GestureDetector(
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
                                      Text(data[index].remark, style: setStyleContent(context,ColorConstant.black,12,FontWeight.w400)),
                                      Text("Successful", style: setStyleContent(context,ColorConstant.greenColor,10,FontWeight.w400)),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text(data[index].amount, style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                                      Text(data[index].remark, style: setStyleContent(context,ColorConstant.black,10,FontWeight.w300))
                                    ],
                                  )
                                ],
                              ),
                            )
                        )
                    );
                  } else if (snapshot.hasError) {
                    print("${snapshot.error}");
                    return Text("${snapshot.error}");

                  }
                  // By default show a loading spinner.
                  return CircularProgressIndicator();
                }
            )
        )
    );
  }

  Future<List<Invest>> fetchDatum(invest) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? apikey = prefs.getString("apikey");
    var jsonResponse = null;
    String Url = "https://thevix.club/apimaster.php";
    var response = await http.post(Uri.parse(Url),
        headers: {
          "Content-Type": "application/json",
          "Operation": "requery",
          "Authorization": "$apikey"
        },
      );
    if (response.statusCode == 200)
      jsonResponse = json.decode(response.body);
    print(response.body.toString());
    if (jsonResponse['status'] == 'success'){
      List Datum = json.decode(response.body);
      return Datum.map((data) => new Invest.fromJson(data)).toList();
    }else {
      throw Exception('Failed to load album');
    }
  }
}





