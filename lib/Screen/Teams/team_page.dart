import 'package:flutter/material.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Account/account_info_page.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';
import 'package:vixx_app/Screen/Pages/deposit_page.dart';
import 'package:vixx_app/Screen/Pages/invest_page.dart';
import 'package:vixx_app/Screen/Pages/transaction_history.dart';
import 'package:vixx_app/Screen/Pages/withdrawal_page.dart';
import 'package:vixx_app/Screen/Teams/team_list.dart';

class TeamsPage extends StatefulWidget{
  @override
  TeamsPageState createState() => TeamsPageState();
}

class TeamsPageState extends State <TeamsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: ColorConstant.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavBar()));
        },
        icon:  Icon(Icons.arrow_back_sharp, size: 25,),
      ),
      actions: [
        IconButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => AccountInformation()));
        },
          icon: Icon(Icons.person_outline_sharp),)
      ],
    ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height:  MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ), color: ColorConstant.primaryColor
                    ),

                  ),
                  SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child:  Text("TEAM",style: setStyleContent(context, ColorConstant.slightWhiteColor, 25, FontWeight.bold),),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        height: 160.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: ()async{
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Center(child: CircularProgressIndicator(
                                            color: ColorConstant.primaryColor,
                                          ),);
                                        });
                                    await teamAction();
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 1", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 2", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 3", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 4", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 5", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 6", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 7", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 8", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor:  ColorConstant.slightWhiteColor,
                                      child: Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 9", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor: ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 10", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor: ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 11", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                GestureDetector(
                                  child:  CircleAvatar(
                                      radius: 30,
                                      backgroundColor: ColorConstant.slightWhiteColor,
                                      child:  Image.asset('assets/images/pesin.png', height: 50,) //For Image Asset
                                  ),
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => TeamsPageList()));
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("GEN 12", style: setStyleContent(context, ColorConstant.slightWhiteColor, 13, FontWeight.w700),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 450.0,
                child:  ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 5,),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("assets/images/pesin.png", height: 60,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alan Byrd", style: setStyleContent(context,ColorConstant.black,15,FontWeight.w700)),
                              Text("@alanbyrd@gmail.com", style: setStyleContent(context,ColorConstant.black,13,FontWeight.w400)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("10/11/21", style: setStyleContent(context,ColorConstant.black,12,FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.all(10),
                            height: 40,
                                 width: 40,
                                decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(25),
                                    color: ColorConstant.blueColor
                                ),
                                child: Center(
                                    child: Text("2", style: setStyleContent(context,ColorConstant.slightWhiteColor,13,FontWeight.bold))
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> teamAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }
}