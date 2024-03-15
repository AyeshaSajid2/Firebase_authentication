import 'package:assignment_three/screens/sigin_email.dart';
import 'package:flutter/material.dart';


class EmailSaignInButton extends StatefulWidget {
  @override
  _EmailSaignInButtonState createState() => _EmailSaignInButtonState();
}

class _EmailSaignInButtonState extends State<EmailSaignInButton> {
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInEmailScreen(),
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
                image: AssetImage("assets/gmail.png"),
                height: 35.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Email',
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