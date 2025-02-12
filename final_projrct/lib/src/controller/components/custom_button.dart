import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onTap;
 
   CustomButton({super.key,required this.onTap,required this.name,this.color=Colors.green});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:height*.02),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height*.075,
          width: width*1,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: BoldText(text: name,color: Colors.white,fontSize: 20,)),
        ),
      ),
    );
  }
}
