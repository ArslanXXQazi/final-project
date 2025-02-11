import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  FontWeight fontWeight;
  double  fontSize;
   CustomText({super.key,
     required this.text,
     this.color=Colors.black,
     this.fontSize=16,
     this.fontWeight=FontWeight.normal,
   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aboreto(
        color:color ,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  String text;
  Color color;
  FontWeight fontWeight;
  double  fontSize;
  BoldText({super.key,
    required this.text,
    this.color=Colors.black,
    this.fontSize=16,
    this.fontWeight=FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aboreto(
        color:color ,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}


