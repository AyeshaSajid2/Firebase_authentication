import 'package:assignment_three/res/customs_colors.dart';
import 'package:flutter/material.dart';


class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/firebase_logo.png',
            height: 24,
          ),
          SizedBox(width: 8),
          Text(
            'FlutterFire',
            style: TextStyle(
              color: CustomColors.firebaseYellow,
              fontSize: 22,
            ),
          ),
          Text(
            ' Authentication',
            style: TextStyle(
              color: CustomColors.firebaseOrange,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}