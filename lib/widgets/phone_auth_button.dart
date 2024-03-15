import 'package:assignment_three/message_auth.dart';
import 'package:flutter/material.dart';


class PhoneAuthSignInButton extends StatefulWidget {
  @override
  _PhoneAuthSignInButtonState createState() => _PhoneAuthSignInButtonState();
}

class _PhoneAuthSignInButtonState extends State<PhoneAuthSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (builder) => PhoneAuthScreen()));
        },

        child: const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/phone.png"),
                height: 35.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Phone Number',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}