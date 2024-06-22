import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

const String baseUrl = 'http://your-backend-url.com';

Future<bool> forgotPassword(String email) async {
  final String apiUrl = '$baseUrl/forgot-password/';
  final Map<String, String> headers = {'Content-Type': 'application/json'};
  final Map<String, String> body = {'email': email};

  try {
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return true; // Password reset email sent successfully
    } else if (response.statusCode == 400) {
      // Email does not exist
      return false;
    } else {
      // Handle other status codes as needed
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> resetPassword(String token, String newPassword) async {
  final String apiUrl = '$baseUrl/reset-password/';
  final Map<String, String> headers = {'Content-Type': 'application/json'};
  final Map<String, String> body = {
    'token': token,
    'new_password': newPassword
  };

  try {
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return true; // Password reset successful
    } else {
      // Handle other status codes as needed
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
        // ignore: prefer_const_constructors
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Please enter your Email ',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_4, color: Colors.white),
                    fillColor: Colors.transparent,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(22, 139, 159, 0.867), width: 7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(22, 139, 159, 0.867), width: 7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(22, 139, 159, 0.867), width: 7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  forgotPassword('email');
                },
                child: Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 139, 159),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      // Add your box shadow properties here
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Set Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
