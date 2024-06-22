import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp3/signup.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 21 ,74 ,82),
              Color.fromARGB(255, 10, 30,37),
            ],
          ),
        ),

          child: Column(
          children: <Widget>[
            Container(
              height: 450,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/IMG_0533.png'),
                ),
              ),
            ),
              Container(
                // Your existing content here
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 0,),
                    Text(
                      'Eyes on the road',
                      style: GoogleFonts.tajawal(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mind Awake',
                      style: GoogleFonts.tajawal(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                        // Handle the tap action
                      
                      child: Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 22, 139, 159),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            // Add your box shadow properties here
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}



