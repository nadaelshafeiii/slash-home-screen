import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gp4/LoginPage.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:http/http.dart' as http;

class EditProfilePage extends StatefulWidget {
  final String email;
  final String username;
  final String emergencyNumber;
  final String password;

  // Constructor
  const EditProfilePage({
    Key? key,
    required this.email,
    required this.username,
    required this.emergencyNumber,
    required this.password,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showAdditionalFields = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emergencyNumberController =
      TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  // Unique GlobalKey for Form widget
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email;
    usernameController.text = widget.username;
    emergencyNumberController.text = widget.emergencyNumber;
  }

  void saveUpdatedData() async {
    String? token = await AuthService.getToken();

    // Example API endpoint for updating user data
    Uri apiUrl = Uri.parse('http://45.242.223.101:8000/updateprofile/');
    try {
      var response = await http.put(
        apiUrl,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token $token',
        },
        body: jsonEncode({
          'email': emailController.text,
          'username': usernameController.text,
          'phone_number': emergencyNumberController.text,
          'old_password': oldPasswordController.text,
          'password': newPasswordController.text,
        }),
      );
      if (response.statusCode == 201) {
        print('User data updated successfully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else if (response.statusCode == 400) {
        print('Failed to update user data');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to update user data'),
          backgroundColor: Colors.red,
        ));
      } else if (response.statusCode == 404) {
        print('Wrong Password');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Wrong Password'),
          backgroundColor: Colors.red,
        ));
      } else {
        print('Unexpected error: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Unexpected error occurred'),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      print('Error updating user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error updating user data'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
            key: _formKey, // Assigning unique GlobalKey to Form
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5,
                            )),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 300.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          isDark
                              ? LineAwesomeIcons.sun_o
                              : LineAwesomeIcons.moon_o,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    )
                  ],
                ),
                // ignore: prefer_const_constructors
                Row(
                  children: const [
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),

                const Divider(
                  color: Colors.white,
                  height: 10,
                  thickness: 1.5,
                  indent: 50,
                  endIndent: 50,
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'username',
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
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextFormField(
                            obscureText: !showAdditionalFields,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.white),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAdditionalFields =
                                        !showAdditionalFields;
                                  });
                                },
                                child: const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.white),
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
                        if (showAdditionalFields)
                          Column(
                            children: [
                              const SizedBox(height: 70),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                                child: TextFormField(
                                  controller: oldPasswordController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter old password',
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(22, 139, 159, 0.867),
                                          width: 7),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(22, 139, 159, 0.867),
                                          width: 7),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(22, 139, 159, 0.867),
                                          width: 7),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                                child: TextFormField(
                                  controller: newPasswordController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter new password',
                                    prefixIcon: const Icon(Icons.lock,
                                        color: Colors.white),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(22, 139, 159, 0.867),
                                          width: 7),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(22, 139, 159, 0.867),
                                          width: 7),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(22, 139, 159, 0.867),
                                          width: 7),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: 130,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                      ),
                                      child: const Center(
                                          child: Text(
                                        '    Check Password',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        controller: emergencyNumberController,
                        decoration: InputDecoration(
                          hintText: 'Emergencynumber',
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
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: SizedBox(
                    width: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveUpdatedData();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 200.0),
                  child: Icon(
                    FontAwesomeIcons.truck,
                    size: 100,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
