import 'package:flutter/material.dart';

import 'custom_Text.dart';


class CustomContainer extends StatelessWidget {
  String text;
   CustomContainer({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return  Container(
      height: height*.06,
      width: width * 1,
      child: CustomText(text:text ),
    );
  }
}
