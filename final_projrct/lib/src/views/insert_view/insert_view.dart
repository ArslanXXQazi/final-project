import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: CustomText(
          text: 'Insert Data ',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.03,vertical: height*.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


        ],),
      ),
    );
  }
}
