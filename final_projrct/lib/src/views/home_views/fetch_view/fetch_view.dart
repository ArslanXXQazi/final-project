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
      body: Column(children: [
        Container(
          height: height*.2,
          width: width*1,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            CustomText(text: "Which package is commonly used for state management in Flutter?"),
            Row(children: [
              CustomText(text: "1)"),
              CustomText(text: "Provider"),
            ],),
            Row(children: [
              CustomText(text: "2)"),
              CustomText(text: "Riverpod"),
            ],),
            Row(children: [
              CustomText(text: "3)"),
              CustomText(text: "Bloc"),
            ],),
            Row(children: [
              CustomText(text: "3)"),
              CustomText(text: "GetX"),
            ],),
          ],),
        )
      ],),
    );
  }
}
