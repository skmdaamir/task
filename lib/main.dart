import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:task/login_page.dart';
import 'package:task/otp_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreenApp(),
  ));
}

class SplashScreenApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SplashScreenAppState createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => OTPPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/login-logo.png',
              height: 150,
              width: 150,
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
            child: Text(
              'Near Me App',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
