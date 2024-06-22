import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool obsecure;

  const Mytextfield({
  super.key,
  required this.controller,
  required this.hinttext,
  required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hinttext,
        ),
      ),
    );
  }
}
