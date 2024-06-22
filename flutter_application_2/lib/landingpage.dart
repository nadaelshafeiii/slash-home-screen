
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class landingpage extends StatelessWidget {
  const landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
      Container(
        height: size.height,
        width: size.width,
        child:Stack(
        children: <Widget>[Positioned(
          top:150,
          left: 80,
          child:Image.asset('assets/images/IMG_0533.png',
          width: size.width*0.6,
        ),
        ),
        ],          
        ),        
      ),
    );
  }
}
