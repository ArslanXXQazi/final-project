import 'package:flutter/material.dart';

import 'custom_Text.dart';


class CustomContainer extends StatelessWidget {
  String text;
  Color color;
  Color fontcolor;
  double fontSize;
  FontWeight fontWeight;
   CustomContainer({super.key,
     required this.text,
     this.color=Colors.white,
     this.fontcolor=Colors.black,
     this.fontSize=14,
     this.fontWeight=FontWeight.normal,
   });

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return  Container(

      width: width * 1,
     decoration: BoxDecoration(
       color: color,
       borderRadius: BorderRadius.circular(10),
     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*.01),
            child: CustomText(text:text,color: fontcolor,fontSize:fontSize ,fontWeight: fontWeight,),
          ),
        ],
      ),
    );
  }
}
