import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vixx_app/Screen/Walkthrough/onboard.dart';
import 'package:vixx_app/Screen/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPref));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPref;
  MyApp(this.sharedPref);
    @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Color(0xFF163560),
      systemNavigationBarDividerColor: Color(0xFF163560),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return  ScreenUtilInit(
            designSize: Size(375, 812),
            builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: "/",
              onGenerateRoute: _onGenerateRoute,
            )
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return OnBoardingPage();
      });
    case "/onBoarding":
      return MaterialPageRoute(builder: (BuildContext context) {
        return OnBoardingPage();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      });
    case "/signUp":
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      });
  }
}
