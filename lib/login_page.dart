import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Color backgroundColor;
  const LoginPage({Key key, this.backgroundColor}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode myFocusNode = new FocusNode();
  TextEditingController numberController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            color: widget.backgroundColor ?? Colors.blueAccent,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: Hero(
                        tag: 'hero-login',
                        child: Image.asset(
                          'assets/login-logo.png',
                          height: 200,
                          width: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(50.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Proceed with your login',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 30.0,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: Card(
                    shadowColor: Colors.grey,
                    elevation: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/enter-mobile-no-icon-box.png",
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.black45,
                          height: 50,
                          width: 2,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: numberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Enter Mobile Number',
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.blue
                                        : Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "A 4 digits OTP will send you via SMS to verify your mobile number!",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    height: 40,
                    child: RaisedButton(
                      child: Text('Send OTP'),
                      onPressed: () {},
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
