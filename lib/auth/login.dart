import 'package:flutter/material.dart';
import 'package:phone_auth_project/auth/otp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white12,
        title: Center(
            child: Text('Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  'Already have an account?',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 18, left: 20, right: 20),
              child: Center(
                child: Text(
                  'Sign in to speed up the checkout process and save your order to your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 44, right: 15, left: 15),
              child: TextField(
                decoration: InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: '+ 1 (800) 439 0206',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    // child: Text('+1'),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 18, left: 15, right: 15),
              width: double.infinity,
              child: FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0)),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OTPScreen(_controller.text)));
                },
                child: Text(
                  'Phone number verification',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
