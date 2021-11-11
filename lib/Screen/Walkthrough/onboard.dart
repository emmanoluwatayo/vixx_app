import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';
import 'package:vixx_app/Config/Color.dart';
import 'package:vixx_app/Config/Style.dart';
import 'package:vixx_app/Screen/login.dart';
import 'package:vixx_app/Screen/registration.dart';


class OnBoardingPage extends StatefulWidget{
  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State <OnBoardingPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider<OnBoardState>(
        create: (_) => OnBoardState(),
        child: Scaffold(
            body: SafeArea(
              child: Container(
               margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              child: OnBoard(
                pageController: pageController,
                onSkip: () {
                  // print('skipped');
                },
                onDone: () {
                  // print('done tapped');
                },
                titleStyles:  setStyleContent(context,Colors.black, 25,FontWeight.bold),
                descriptionStyles:  setStyleContent(context,Colors.black, 15,FontWeight.normal),
                onBoardData: onBoardData,
                imageHeight: 320,
                imageWidth: 300,
                pageIndicatorStyle: const PageIndicatorStyle(
                  width: 50,
                  inactiveColor: Colors.grey,
                  activeColor: Color(0xFF163560),
                  inactiveSize: Size(8, 8),
                  activeSize: Size(12, 12),
                ),
                skipButton: TextButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child:  Text(
                    "Skip",
                    style:setStyleContent(context,ColorConstant.primaryColor, 18,FontWeight.w700),
                  ),
                ),
                nextButton: Consumer<OnBoardState>(
                    builder: (BuildContext context, OnBoardState state,
                        Widget? child) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: ()  =>
                                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage())),
                            child: Container(
                                width: 150,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color:  ColorConstant.primaryColor ),
                                ),
                                child: Text('Login', style: setStyleContent(context,Colors.black, 15,FontWeight.w300) )),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationPage())),
                            child: Container(
                                width: 150,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorConstant.primaryColor,),
                                child: Text('Register', style: setStyleContent(context,Colors.white, 15,FontWeight.w300))),
                          )
                        ],
                      );
                    }),
              ),
              )
            )
        )
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInCirc,
      );
    } else {
      // print("done");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Deposits",
    description: "Make quick deposits into your account with ease.",
    imgUrl: "assets/images/deposit_icon.png",
  ),
  const OnBoardModel(
    title: "Invest",
    description:
    "Begin your journey to wealth. Invest your money today!",
    imgUrl: 'assets/images/invest_icon.png',
  ),
  const OnBoardModel(
    title: "Withdraw",
    description:
    "Withdrawal funds instantly and at your own convenience ",
    imgUrl: 'assets/images/withdraw_icon.png',
  ),
];