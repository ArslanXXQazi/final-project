import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFromField extends StatelessWidget {
  String hintText;
  String labelText;
  int    maxLines;
  TextEditingController controller;
 CustomTextFromField({super.key,
   required this.controller,
   required this.hintText,
   required this.labelText,
   this.maxLines=1
 });

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: height*.01),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: GoogleFonts.aBeeZee(
            color: Colors.blue
          ),
          labelStyle: GoogleFonts.aBeeZee(),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green),
          ),
        ),),
    );
  }
}
