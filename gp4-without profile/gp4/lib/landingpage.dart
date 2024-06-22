import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp4/signuppage.dart';
// ignore: camel_case_types
class landingpage extends StatelessWidget {
  const landingpage({super.key});

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
        child:Center(
          child: SingleChildScrollView(
            child: Column(
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
                      Icons.light,
                      size: 30,
                      color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                const SizedBox(height: 100,),
                Image.asset('assets/images/IMG_0533.png',
                  width: 250,
                ), 
              const SizedBox(height: 80,),
                
                Text(
                        'Eyes On The Road',
                        style: GoogleFonts.tajawal(
                          color: const Color(0xFFF1EEEE),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                Text(
                        'Mind Awake',
                        style: GoogleFonts.tajawal(
                          color: const Color(0xFFF1EEEE),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                      const SizedBox(height: 15,), 
                    GestureDetector(
                        onTap: () {  Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  const SignupPage()));
                    },
                          // Handle the tap action
                        
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
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),        
      ),
    );
  }
}
