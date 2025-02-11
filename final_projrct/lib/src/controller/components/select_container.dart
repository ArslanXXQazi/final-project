import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';

class SelectContainer extends StatelessWidget {
  String text;
  VoidCallback onTap;
  Color backColor;
  Color fontColor;
   SelectContainer({super.key,
     required this.onTap,
     required this.text,
     this.backColor=Colors.grey,
     this.fontColor=Colors.black,
   });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height*.04,
        width: width*.08,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: CustomText(text: text,color: fontColor,fontWeight: FontWeight.bold,)),
      ),
    );
  }
}
