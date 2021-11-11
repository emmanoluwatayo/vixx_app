import 'package:flutter/material.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/Account/account_info_page.dart';
import 'package:vixx_app/Screen/HomeScreen/bottom_nav.dart';

class TeamsPageListPage extends StatefulWidget{
  @override
  TeamsPageListPageState createState() => TeamsPageListPageState();
}

class TeamsPageListPageState extends State <TeamsPageListPage>{
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
      );
  }
}