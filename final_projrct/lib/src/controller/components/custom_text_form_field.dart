import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  String lableText;
  int maxlines;
  TextEditingController controller;
   CustomTextFormField({super.key,
     required this.hintText,
     required this.lableText,
     required this.controller,
     this.maxlines=1
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.aBeeZee(),
        labelText: lableText,
        labelStyle: GoogleFonts.aBeeZee(),
      ),
    );
  }
}
