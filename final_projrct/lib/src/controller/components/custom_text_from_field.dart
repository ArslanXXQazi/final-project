import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  String hintText;
  String labelText;
  TextEditingController controller;
 CustomTextFromField({super.key,
   required this.controller,
   required this.hintText,
   required this.labelText,
 });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter Your Question',
        labelText: 'Enter Your Question',
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),);
  }
}
