import 'package:flutter/material.dart';
import 'package:flutter_application_2/compomenets/my_buuton.dart';
import 'package:flutter_application_2/compomenets/my_textfield.dart';
import 'package:flutter_application_2/compomenets/square_tile.dart';
import 'package:flutter_application_2/landingpage.dart';

class login extends StatelessWidget {
  login({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //signuserin method
  //void SignuserIn() {
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(''), fit: BoxFit.cover),
        ),
        child: Center(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 25),

                  Text(
                    'WELCOME',
                    style: TextStyle(
                      color: Color.fromARGB(255, 22, 8, 17),
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'username',
                    obsecureText: false,
                  ),

                  const SizedBox(height: 30),

                  //password
                  MyTextField(
                    controller: passwordController,
                    hintText: 'password',
                    obsecureText: true,
                  ),

                  const SizedBox(height: 10),

                  //forget password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  //sign in button
                MyButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => landingpage()));
                  },
                  ),

                  const SizedBox(height: 50),

                  //or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'or continue with',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  //google + apple sign in buttons

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      square_tile(
                          imagepath:
                              'lib/images/Google_Chrome_icon_(February_2022).svg.png'),
                      const SizedBox(width: 20),
                      square_tile(imagepath: 'lib/images/download.png'),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Register Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
