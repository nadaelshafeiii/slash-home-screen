
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp2/components/my_textfield.dart';

class Mylogin extends StatefulWidget {
  Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal, // Dark teal background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_shipping, // Truck icon
                size: 64,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              //email
              Mytextfield(
                  controller: emailcontroller,
                  hinttext: 'Email',
                  obsecure: false),
              //password
              Mytextfield(
                  controller: passwordcontroller,
                  hinttext: 'Password',
                  obsecure: true),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email:emailcontroller.text,
                    password:passwordcontroller.text,
                  );
                }, // Handle login logic

                child: Text('Log in'),
              ),
              SizedBox(height: 16),
              Text(
                "Don't have an account? Sign up!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
