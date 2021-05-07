import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/screens/pakunki_main.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:phone_auth_project/screens/packages_list.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.white12,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white12,
          title: Padding(
            padding: EdgeInsets.only(left: 75),
            child: Text(
              'Verification',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          )),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/paw.png"), fit: BoxFit.fitHeight),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                'Enter the code to verify',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 18, left: 15, right: 15),
            child: Center(
              child: Text(
                'We will send a verification code to your phone using a text message.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4)),
            margin: EdgeInsets.fromLTRB(15, 44, 15, 0),
            padding: EdgeInsets.fromLTRB(50, 7, 50, 0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 17.0, color: Colors.black),
              eachFieldWidth: 0.0,
              eachFieldHeight: 0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Pakunki()),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState
                      .showSnackBar(SnackBar(content: Text('invalid OTP')));
                }
              },
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
              onPressed: () {},
              child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left: 40, right: 40),
            child: Center(
              child: Text(
                'Если вы не получили код в течение одного года,нажмите ниже, чтобы повторно отправить его :)',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Pakunki()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
