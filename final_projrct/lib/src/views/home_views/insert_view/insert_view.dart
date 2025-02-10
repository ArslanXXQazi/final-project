import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_button.dart';
import 'package:final_projrct/src/controller/components/custom_text_from_field.dart';
import 'package:final_projrct/src/dbhelper/dbhelper.dart';
import 'package:final_projrct/src/model/main_model.dart';
import 'package:final_projrct/src/views/home_views/fetch_view/fetch_controller.dart';
import 'package:final_projrct/src/views/home_views/insert_view/insert_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InsertView extends StatelessWidget {
  const InsertView({super.key});
  @override
  Widget build(BuildContext context) {
    InsertController insertController=Get.put(InsertController());
    FetchController fetchController=Get.put(FetchController());
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: CustomText(
          text: 'Insert Your Questions',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.03,vertical: height*.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFromField(
                  controller:insertController.questionController,
                  hintText: "Enter your question",
                  labelText: "Enter your question",
              ),
              CustomTextFromField(
                  controller: insertController.option1Controller,
                  hintText: "Enter your first option",
                  labelText: "Enter your first option",
              ),
              CustomTextFromField(
                  controller: insertController.option2Controller,
                  hintText: "Enter your second option",
                  labelText: "Enter your second option",
              ),
              CustomTextFromField(
                  controller: insertController.option3Controller,
                  hintText: "Enter your third option",
                  labelText: "Enter your third option",
              ),
              CustomTextFromField(
                  controller: insertController.option4Controller,
                  hintText: "Enter your fourth option",
                  labelText: "Enter your fourth option",
              ),
             Obx((){
               return insertController.isLoading.value?Center(child: CircularProgressIndicator()):
               CustomButton(
                 onTap: (){
                   insertController.insertData();
                   fetchController.fetchData();
                 },name: "Insert Data",
               );
             })
          ],),
        ),
      ),
    );
  }
}
