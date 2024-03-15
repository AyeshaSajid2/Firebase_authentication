import 'package:assignment_three/res/customs_colors.dart';
import 'package:assignment_three/screens/sigin_anonym_screen.dart';
import 'package:flutter/material.dart';

class AnonymousSignInButton extends StatefulWidget {
  @override
  _AnonymousSignInButtonState createState() => _AnonymousSignInButtonState();
}

class _AnonymousSignInButtonState extends State<AnonymousSignInButton> {
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
          backgroundColor: MaterialStateProperty.all(CustomColors.firebaseGrey),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInAnonymScreen(),
            ),
          );
        },
        child: const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/anonymous.png"),
                height: 35.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in Anonymously',
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