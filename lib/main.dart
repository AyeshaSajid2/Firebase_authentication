import 'package:assignment_three/screen_dashboard.dart';
import 'package:assignment_three/widgets/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      // options: const FirebaseOptions(
      //     apiKey: 'AIzaSyDr-M7_tGPvyle1urT_WeAc0cG4WGJpai4',
      //     appId: '1:25840478730:web:d5434467585de9e9250df3',
      //     messagingSenderId: '25840478730',
      //     projectId: 'assignment3-fa00b',
      //     authDomain: 'assignment3-fa00b.firebaseapp.com',
      //     storageBucket: 'assignment3-fa00b.appspot.com',
      // )
  );
      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment #3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ScreenDashboard(),
      home: SplashScreen(),

    );
  }
}
