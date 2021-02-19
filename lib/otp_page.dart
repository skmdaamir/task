import 'package:flutter/material.dart';
import 'package:task/otp_verify.dart';

class OTPPage extends StatefulWidget {
  final Color backgroundColor;

  const OTPPage({Key key, this.backgroundColor}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                // height: 200,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: widget.backgroundColor ?? Colors.blueAccent,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: Image.asset(
                        'assets/login-logo.png',
                        height: 200,
                        width: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(50.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text('Verify with OTP:',
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Enter OTP',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: OTPVerify(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
