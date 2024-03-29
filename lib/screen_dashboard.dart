import 'package:assignment_three/res/custom_app_bar_colors.dart';
import 'package:assignment_three/res/custom_button_colors.dart';
import 'package:assignment_three/res/customs_colors.dart';
import 'package:assignment_three/utils/authentication.dart';
import 'package:assignment_three/widgets/anonym_signin_button.dart';
import 'package:assignment_three/widgets/app_bar_title.dart';
import 'package:assignment_three/widgets/email_signin_button.dart';
import 'package:assignment_three/widgets/googlr_signin_button.dart';
import 'package:assignment_three/widgets/phone_auth_button.dart';
import 'package:flutter/material.dart';


class ScreenDashboard extends StatelessWidget {
  const ScreenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        title: AppBarTitle(), backgroundColor: CustomColors.firebaseNavy,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [

              const SizedBox(height: 60),
              AnonymousSignInButton(),

              const SizedBox(height: 30,),
              EmailSaignInButton(),

              const SizedBox(height: 30),
              PhoneAuthSignInButton(),

              const SizedBox(height: 30,),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
