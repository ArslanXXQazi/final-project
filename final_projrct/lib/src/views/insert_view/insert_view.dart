import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_text_from_field.dart';
import 'package:flutter/material.dart';

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {

  TextEditingController questionController=TextEditingController();
  TextEditingController firstOptionController=TextEditingController();
  TextEditingController secondOptionController=TextEditingController();
  TextEditingController thirdOptionController=TextEditingController();
  TextEditingController fourthOptionController=TextEditingController();
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
            CustomTextFromField(
                controller: questionController,
                hintText: "Enter your question",
                labelText: "Enter your question",
            ),
            CustomTextFromField(
                controller: firstOptionController,
                hintText: "Enter your first option",
                labelText: "Enter your first option",
            ),
            CustomTextFromField(
                controller: secondOptionController,
                hintText: "Enter your second option",
                labelText: "Enter your second option",
            ),
            CustomTextFromField(
                controller: thirdOptionController,
                hintText: "Enter your third option",
                labelText: "Enter your third option",
            ),
            CustomTextFromField(
                controller: fourthOptionController,
                hintText: "Enter your fourth option",
                labelText: "Enter your fourth option",
            ),
            Container(
              height: height*.06,
              width: width*1,
             decoration: BoxDecoration(
               color: Colors.orange,
               borderRadius: BorderRadius.circular(10),
             ),
              child: Center(child: CustomText(text: 'Inter Data',color: Colors.white,fontSize: 20,)),
            )
        ],),
      ),
    );
  }
}
