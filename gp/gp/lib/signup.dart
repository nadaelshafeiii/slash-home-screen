import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}



class SignUpPage extends StatelessWidget {
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
              Color.fromARGB(255, 6, 76, 75),
              Color.fromARGB(255, 4, 60, 55),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create an account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20.0),
          
                  child: TextFormField(                
                    decoration: InputDecoration(
                      filled: true,
                    fillColor: Color.fromARGB(0, 4, 63, 69),                
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        ),
                    ),
                    ),
                ),
              
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(0, 4, 63, 69),                
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      ),
                  ),
                ),
              ),
            
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(0, 4, 63, 69),                
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(0, 4, 63, 69),                
                    labelText: 'Emergnvy contant',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              
              
                          Center(
                            child: GestureDetector(
                              onTap: (){},
                              child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                                                        ),
                            ),
                          ),
              
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Try sign up with other ways'),
                  SizedBox(width: 8),
                  Icon(Icons.mail),
                  SizedBox(width: 8),
                  Icon(Icons.nature),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
