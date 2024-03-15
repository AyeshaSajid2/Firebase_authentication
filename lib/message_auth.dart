import 'package:assignment_three/res/custom_app_bar_colors.dart';
import 'package:assignment_three/res/customs_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+92${_phoneNumberController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Handle verification completion, if necessary
        print("Sign in Successful");
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String? verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId!;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout
      },
    );
  }

  void signInWithOTP(BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: _otpController.text,
      );
      await _auth.signInWithCredential(credential);
      // Navigate to HomeScreen after successful sign-in
      print("Sign in Successful");
      // Clear text fields
      _phoneNumberController.clear();
      _otpController.clear();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Sign in with Phone Num',
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/status_at_phone.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(40.10),
              child: TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: 'Enter Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  focusColor: Colors.green,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: verifyPhoneNumber,
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFFFFA000))),
              label: Text('Send OTP',style: TextStyle(color: Colors.black),),
              icon: Icon(Icons.access_time, color: CustomColors.firebaseNavy,),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: TextField(
                controller: _otpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: 'Enter OTP',
                  prefixIcon: Icon(Icons.numbers_rounded),
                  filled: true,
                  focusColor: Colors.green,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => signInWithOTP(context),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFFFFA000))),
              label: Text('Sign In', style: TextStyle(color: Colors.black),),
              icon: Icon(Icons.other_houses_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
