// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp4/LoginPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final phone_numbercontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isVible = true;

  Future<void> signUp(String email, String username , String password, String phone_number) async {
    final response = await http.post(
      Uri.parse('http://45.242.109.48:8000/signup/'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'username' : username,
        'password': password,
        'phone_number' : phone_number,
      }),
    );
    if (response.statusCode == 201) {
      print('tt');
      // Signup successful
      // Navigate user to the home screen, for example
    } else {
      print('ff');

      // Signup failed
      // Display error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 21, 74, 82),
              Color.fromARGB(255, 10, 30, 37),
            ],
          ),
        ),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Create an \n account',
                  style: GoogleFonts.tajawal(
                    color: const Color(0xFFF1EEEE),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 250),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.person_4, color: Colors.white),
                      fillColor: Colors.transparent,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    'username',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username is required";
                      }
                      return null;
                    },
                    controller: usernamecontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.person_4, color: Colors.white),
                      fillColor: Colors.transparent,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    'password',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                      return null;
                    },
                    controller: passwordcontroller,
                    obscureText: isVible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVible = !isVible;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    ' Confirm password',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;

/*                     else if (passwordcontroller.text != value) {
                      return "Passwords don't match";
                      }
                      return null; */
                    },
                    controller: confirmpasswordcontroller,
                    obscureText: isVible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVible = !isVible;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    'Emergency contact',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Emergency contact is required";
                      }
                      return null;
                    },
                    controller: phone_numbercontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.person_4, color: Colors.white),
                      fillColor: Colors.transparent,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(22, 139, 159, 0.867),
                            width: 7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Handle the tap action
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 139, 159),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {

                        signUp(
                            emailcontroller.text.toString(),
                            usernamecontroller.text.toString(),
                            passwordcontroller.text.toString(),
                            phone_numbercontroller.text.toString()
                            );
                      }
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Try sign up with :',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const ImageIcon(
                  AssetImage('assets/images/download (1).png'),
                  size: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log in',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 22, 139, 159),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  LoginPage()));
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
