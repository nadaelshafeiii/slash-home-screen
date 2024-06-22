import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gp4/EditProfile.dart';
import 'package:gp4/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'main.dart';
import 'LoginPage.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name;
  bool isLoading = true;
  Map<String, dynamic>? userData;
  @override
  void initState() {
    super.initState();
    fetchUserData(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> fetchUserData(context) async {
    String? token = Provider.of<TokenProvider>(context, listen: false).token;
    var response = await http.get(
      Uri.parse('http://45.242.109.48:8000/currentuserdetails/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );
    if (response.statusCode == 200) {
      setState(() {

        name = jsonDecode(response.body)['username'];
        userData = json.decode(response.body)['username'];
        isLoading = false;
        print('done');
      });
    } else {
      setState(() {
        isLoading = false;
        print(token);

        print('error');
      }); // Throw an exception to indicate failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  fetchUserData(context);
                },
                child: Text('show')),
            const Padding(
              padding: EdgeInsets.only(right: 100.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(
                height:
                    20), // Add spacing between username/icon and user details
            if (userData != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      color: Colors.white,
                      height: 10,
                      thickness: 1.5,
                      indent: 0,
                      endIndent: 0,
                    ),
                    const SizedBox(height: 40),
                    Text('Email: ${userData?['email']}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    const SizedBox(height: 20),
                    Text('Username: ${userData?['username']}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    const SizedBox(height: 20),
                    Text('Emergency number: ${userData?['phone_number']}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePage(
                                  email: userData?['email'],
                                  username: userData?['username'],
                                  emergencyNumber: userData?['phone_number'] ??
                                      'No emergency number',
                                  password:
                                      userData?['password'] ?? 'No password',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          child: const Text('Edit ',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 110),
                    const Padding(
                      padding: EdgeInsets.only(left: 170.0),
                      child: Icon(
                        FontAwesomeIcons.truckFast,
                        size: 135,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
    /*  return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: fetchUserData(context),
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final userData = snapshot.data?['data'];
            return _buildProfileView(context, userData);
          }
        },
      ),
    );
  } */
  }
}
