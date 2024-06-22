import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gp4/LoginPage.dart';
import 'package:http/http.dart' as http;

class PasswordReset extends StatefulWidget {
  final String email;

  PasswordReset({Key? key, required this.email});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isVisible = true;

  Future<void> _changePassword() async {

    // Get the passwords entered by the user
    String new_password = _passwordController.text;
    String confirmedPassword = _confirmPasswordController.text;
    // Verify that passwords match
    if (new_password != confirmedPassword) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Passwords do not match.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    // Send the new password to the API
    final Uri url = Uri.parse('http://45.242.223.101:8000/resetpassword/');
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'new_password': new_password,
          'email': widget.email,
        }),
      );

      if (response.statusCode == 201) {
      print(widget.email);

        print('success');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
                print(widget.email);

        throw Exception('Failed to change password');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(),
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
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 180,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 240.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _isVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: Icon(
                        _isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
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
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 170),
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _isVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: Icon(
                        _isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
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
                height: 25,
              ),
              Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 22, 139, 159),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextButton(
                  onPressed: _changePassword,
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
