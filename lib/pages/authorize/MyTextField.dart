import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final IconData IconsData;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.IconsData,
      required this.obscureText,
      required this.controller,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500,),
          suffixIcon: Icon(IconsData),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
