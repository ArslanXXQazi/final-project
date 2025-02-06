import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: GestureDetector(
            onTap: (){
              
            },
            child: Container(
              height: height*.3,
              width: width*.7,
             decoration: BoxDecoration(
               color: Colors.green.shade400,
               borderRadius: BorderRadius.circular(20),
             ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.add,size: width*.15,color: Colors.white,),
                CustomText(text: 'Insert Question',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),
              ],),
            ),
          ),
        ),
          SizedBox(height: height*.03,),
          Center(
            child: GestureDetector(
              onTap: (){},
              child: Container(
                height: height*.3,
                width: width*.7,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_red_eye,size: width*.15,color: Colors.white,),
                    CustomText(text: 'View Question',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),
                  ],),
              ),
            ),
          ),
      ],),
    );
  }
}
