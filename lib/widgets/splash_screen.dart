
import 'dart:async';
import 'package:assignment_three/res/customs_colors.dart';
import 'package:assignment_three/screen_dashboard.dart';
import 'package:assignment_three/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 15), () {
      // Redirect to the next screen after 5 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ScreenDashboard(), // Replace NextScreen with your desired screen
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(

              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/firebase_logo.png',
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'FlutterFire',
                      style: TextStyle(
                        color: CustomColors.firebaseYellow,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'Authentication',
                      style: TextStyle(
                        color: CustomColors.firebaseOrange,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _timer.cancel(); // Cancel the timer when "Get Started" is pressed
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ScreenDashboard(), // Replace NextScreen with your desired screen
                    ),
                  );
                },
                child: Text('Get Started',style: TextStyle(color: Colors.white), ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFA000)), ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
