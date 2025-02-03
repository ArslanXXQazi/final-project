import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: (){},
      child: Container(
        height: height*.06,
        width: width*1,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: CustomText(text: 'Inter Data',color: Colors.white,fontSize: 20,)),
      ),
    );
  }
}
