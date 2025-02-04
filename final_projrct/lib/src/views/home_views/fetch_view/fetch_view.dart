import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';


class FetchView extends StatelessWidget {
  const FetchView({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: CustomText(
          text: 'Fetched Data ',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
        child: Column(
          children: [
          Container(
            height: height*.3,
            width: width*1,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomText(text: "Which package is commonly used for state management in Flutter?"),
                Row(children: [
                 Container(
                   height: height*.05,
                   width: width*.05,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     shape: BoxShape.circle,
                     border: Border.all(color: Colors.grey),
                   ),
                   child: Icon(Icons.check,size: width*.04,),
                 ),
                 SizedBox(width: width*.02,),
                  CustomText(text: "Provider"),
                ],),
                Row(children: [
                  Container(
                    height: height*.05,
                    width: width*.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Icon(Icons.check,size: width*.04,),
                  ),
                  SizedBox(width: width*.02,),
                  CustomText(text: "Provider"),
                ],),
                Row(children: [
                  Container(
                    height: height*.05,
                    width: width*.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Icon(Icons.check,size: width*.04,),
                  ),
                  SizedBox(width: width*.02,),
                  CustomText(text: "Provider"),
                ],),
                Row(children: [
                  Container(
                    height: height*.05,
                    width: width*.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Icon(Icons.check,size: width*.04,),
                  ),
                  SizedBox(width: width*.02,),
                  CustomText(text: "Provider"),
                ],),
              ],),
            ),
          )
        ],),
      ),
    );
  }
}
