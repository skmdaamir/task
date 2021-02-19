import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';

class OTPVerify extends StatefulWidget {
  final String phoneNumber;

  const OTPVerify({Key key, this.phoneNumber}) : super(key: key);
  @override
  _OTPVerifyState createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  var onTapRecognizer;
  final formKey = GlobalKey<FormState>();

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;

  String curretText = "";

  Timer time;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentText;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(children: [
              Form(
                key: formKey,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.blue.shade100,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 4) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(20),
                        inactiveFillColor: Colors.white,
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: hasError ? Colors.white : Colors.blue,
                      ),

                      enablePinAutofill: true,
                      cursorColor: Colors.blue,

                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                hasError ? "*Please fill up all the cells properly" : "",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: "Resend OTP in ",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                  children: [
                    TextSpan(
                        text: "Timer",
                        recognizer: onTapRecognizer,
                        style: TextStyle(
                            color: Color(0xFF91D3B3),
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                  ]),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 40,
                child: RaisedButton(
                  color: Colors.blueGrey,
                  onPressed: () {
                    formKey.currentState.validate();
                    // conditions for validating
                    if (currentText.length != 4) {
                      errorController.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() {
                        hasError = true;
                      });
                    } else {
                      setState(() {
                        hasError = false;
                        SnackBar(
                          content: Text("Aye!!"),
                          duration: Duration(seconds: 2),
                        );
                      });
                    }
                  },
                  child: Center(
                      child: Text(
                    "VERIFY".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
