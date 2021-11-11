import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/HomeScreen/homesdreen.dart';
import 'package:vixx_app/Screen/Pages/deposit_page.dart';
import 'package:vixx_app/Screen/Pages/invest_page.dart';
import 'package:vixx_app/Screen/Pages/transaction_history.dart';
import 'package:vixx_app/Screen/Pages/withdrawal_page.dart';
import 'package:vixx_app/Screen/Teams/team_list.dart';
import 'package:vixx_app/Screen/Teams/team_page.dart';

class BottomNavBar extends StatefulWidget {

  BottomNavBar({this.api_key});
  final api_key;

  @override
  BottomNavBarState createState() => new BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  List<dynamic> _page = [
    HomeScreen(),
    InvestPage(),
    DepositPage(),
    WithdrawalPage(),
    TeamsPage(),
  ];
  int _activePage = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  static String? get username => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Image.asset("assets/images/hmm.png", height: 25,color: ColorConstant.primaryColor,),
            Image.asset("assets/images/in_icon.png", height: 30,color: ColorConstant.primaryColor,),
            Image.asset("assets/images/wallet_icon.png", height: 30,color: ColorConstant.primaryColor,),
            Image.asset("assets/images/with_icon.png", height: 30,color: ColorConstant.primaryColor,),
            Image.asset("assets/images/grp_inc.png", height: 50,color: ColorConstant.primaryColor,),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: ColorConstant.primaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _activePage = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _page[_activePage],
          ),
        )
    );
  }
}