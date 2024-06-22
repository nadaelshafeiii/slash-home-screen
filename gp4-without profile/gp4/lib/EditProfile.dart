import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';


class EditProfilePage extends StatelessWidget {
  final String email;
  final String username;
  final String emergencyNumber;
  final String password;

    static Future<void> updateUserData({
    required int userId,
    required Map<String, dynamic> updatedData,
  }) async {
    final apiUrl = 'https://reqres.in/api/users/2$userId'; // Replace with your API endpoint
    final headers = <String, String>{
      'Content-Type': 'application/json',
      // Add any additional headers if required
    };

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(updatedData),
      );

      if (response.statusCode == 200) {
        print('Data updated successfully');
      } else {
        print('Failed to update data: ${response.statusCode}');
        throw Exception('Failed to update data');
      }
    } catch (e) {
      print('Error updating data: $e');
      throw Exception('Error updating data');
    }
  }

  const EditProfilePage({
    Key? key,
    required this.email,
    required this.username,
    required this.emergencyNumber,
    required this.password
  }) : super(key: key);

  // Rest of the code remains the same

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
                        icon:  Icon(isDark?
                        LineAwesomeIcons.sun_o:LineAwesomeIcons.moon_o,
                          color: Colors.white,
                          size: 24,
                        )),
                  )
                ],
              ),
              // ignore: prefer_const_constructors
              Row(
                children:  const [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(width: 30,),
                Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ), 

              SizedBox(width: 30,),

                ],
              ),  

              const Divider(
                color: Colors.white,
                height: 10,
                thickness: 1.5,
                indent: 50,
                endIndent: 50,
              ),
              const SizedBox(height: 50,),
              Column(
            
            children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: TextFormField(
              initialValue: email,
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
              ),),
            ),   
            const SizedBox(height: 25,),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: TextFormField(
              initialValue: username,
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
              ),                                  ),
            ),
            const SizedBox(height: 25,),

            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: TextFormField(
              initialValue: password,
              decoration: InputDecoration(
                hintText: 'Password',
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
              ),                                  ),
            ),
            const SizedBox(height: 25,),

            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: TextFormField(
              initialValue: emergencyNumber,
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
              const SizedBox(height: 60,),
              Center(
                child: SizedBox(
                width: 130,
                child: ElevatedButton(
                onPressed: (){
                updateUserData(
                  userId: 123, // Replace with the actual user ID
                  updatedData: {
                    'email': 'new_email@example.com',
                    'username': 'new_username',
                    // Add other updated fields as needed
                  },
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child:const Text('Save',style: TextStyle(color: Colors.white),)),),
              ),
              const SizedBox(height: 100,),
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
    );
  }
}