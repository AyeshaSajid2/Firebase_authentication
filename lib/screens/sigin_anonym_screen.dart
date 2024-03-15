import 'package:assignment_three/res/custom_app_bar_colors.dart';
import 'package:assignment_three/res/customs_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInAnonymScreen extends StatefulWidget {
  const SignInAnonymScreen({super.key});

  @override
  State<SignInAnonymScreen> createState() => _SignInAnonymScreenState();
}

class _SignInAnonymScreenState extends State<SignInAnonymScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: const CustomAppBar(
        title: 'Sign in Anonymously',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/anonym.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: 'Enter Email',
                  prefixIcon: const Icon(Icons.email),
                  filled: true,
                ),
              ),
              const SizedBox(height: 25,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: 'Enter Password',
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40,),
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
                    User? user = userCredential.user;
                    if (user != null) {
                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Anonymous user signed in: ${user.uid}')),
                      );
                      // Clear text fields
                      emailController.clear();
                      passwordController.clear();
                    } else {
                      // Handle null user case
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to sign in anonymously')),
                      );
                    }
                  } catch (e) {
                    // Handle sign in errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error signing in anonymously: $e')),
                    );
                  }
                },
                label: const Text(
                  'Sign In Anonymously',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFA000)),
                ),
                icon: Icon(Icons.account_box_outlined, color: CustomColors.firebaseNavy,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
