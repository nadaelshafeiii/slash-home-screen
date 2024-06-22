
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gp4/ForgotPasswordPage.dart';
import 'package:gp4/profile.dart';
import 'package:gp4/secure_storage.dart';
import 'package:gp4/signuppage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final username = TextEditingController();
final password = TextEditingController();
bool isVisible = true;
final formKey = GlobalKey<FormState>();
bool isLoginTrue = false;
Future<void> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://45.242.109.48:8000/login/'),
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 201) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final String token = responseData['token'];
    print('done');
    print(token);
    await TokenStorage().saveToken(token);
    Provider.of<TokenProvider>(context as BuildContext, listen: false).setToken(token);
    Navigator.of(context as BuildContext).pushReplacement(
        MaterialPageRoute(builder: ((context) => ProfilePage())));
  } else {
    print('login failed');
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(context) {
    return Scaffold(
        body: Form(
      child: Column(
        children: [
          Expanded(
            flex: 2, // This child will take up twice the space of the next one
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 11, 39, 47),
                        Color.fromARGB(255, 11, 61, 71),
                        Color.fromARGB(255, 10, 117, 135),
                      ],
                    ),
                  ),
                  child: const Center(),
                ),
                const Positioned(
                    bottom: 15,
                    left: 5,
                    child: Icon(
                      FontAwesomeIcons.truck,
                      size: 100,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Expanded(
            flex:
                4, // This child will take up half the space of the previous one
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 10, 30, 37),
                    Color.fromARGB(255, 21, 74, 82),
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter, // Aligns the text to the center
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 220),
                          child: Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
                            controller: username,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "username is required";
                              }
                              return null;
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_4,
                                  color: Colors.white),
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
                          height: 15,
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
                            controller: password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password is required";
                              }
                              return null;
                            },
                            obscureText: isVisible,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.white),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
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
                        Padding(
                          padding: const EdgeInsets.only(left: 170.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ForgotPasswordPage();
                              }));
                            },
                            child: const Text(
                              'Forgot passwored?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 22, 139, 159),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
                                login(username.text.toString(),
                                    password.text.toString());
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfilePage())); 
                              }
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          textAlign: TextAlign.center, // Center the text
                          text: TextSpan(
                            text: 'Do not have an account? ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\n Sign up !',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 22, 139, 159),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignupPage()));
                                  },
                              ),
                            ],
                          ),
                        ),
                        isLoginTrue
                            ? const Text(
                                "Username or Password is incorrect ",
                                style: TextStyle(color: Colors.red),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
