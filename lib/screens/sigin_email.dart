import 'package:assignment_three/res/custom_app_bar_colors.dart';
import 'package:assignment_three/res/customs_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInEmailScreen extends StatefulWidget {
  const SignInEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignInEmailScreen> createState() => _SignInEmailScreenState();
}

class _SignInEmailScreenState extends State<SignInEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Sign in with Email",
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
                      'assets/email.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
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
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    // Show success messages
                    print("Signin with email user:  ${userCredential.user}");
                    print("\n Signin with email Additional user info:  ${userCredential.additionalUserInfo}");
                    print("\n Signin with email credential: ${userCredential.credential}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sign In Successful')),
                    );
                    // Clear text fields
                    emailController.clear();
                    passwordController.clear();
                  } catch (e) {
                    // Handle sign in errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error signing in: $e')),
                    );
                  }
                },
                label: const Text('Sign In', style: TextStyle(color: Colors.black),),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFA000)),
                ),
                icon: Icon(Icons.email_outlined,color: CustomColors.firebaseNavy,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
