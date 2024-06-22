import 'package:flutter/material.dart';
import 'package:login/compomenets/drawer.dart';
import 'package:login/pages/login.dart';
import 'package:login/pages/profile_page.dart';

class HomPage extends StatelessWidget {
  const HomPage({super.key,});

//sign user out method
  void signout() {    
  }

//navigate to profile page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(        
      onsignout: signout,
      ),
      body: Center(
        child: Text('♡ Logged In ♡'),
      ),
    );
  }
}
