import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_button.dart';
import 'package:final_projrct/src/controller/components/custom_text_from_field.dart';
import 'package:final_projrct/src/dbhelper/dbhelper.dart';
import 'package:final_projrct/src/model/main_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  int id;
  String question;
  String option1;
  String option2;
  String option3;
  String option4;

 UpdateData({super.key,
   required this.id,
   required this.question,
   required this.option1,
   required this.option2,
   required this.option3,
   required this.option4,
 });

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController questionController=TextEditingController();

  TextEditingController option1Controller=TextEditingController();

  TextEditingController option2Controller=TextEditingController();

  TextEditingController option3Controller=TextEditingController();

  TextEditingController option4Controller=TextEditingController();


  void initState(){

    super.initState();
    questionController.text=widget.question;
    option1Controller.text=widget.option1;
    option2Controller.text=widget.option2;
    option3Controller.text=widget.option3;
    option4Controller.text=widget.option4;

  }


  updateData() async
  {

await dbClass.updateData(
    id: widget.id,
    model:MainModel(
        question: questionController.text,
        option1: option1Controller.text,
        option2: option2Controller.text,
        option3: option3Controller.text,
        option4: option4Controller.text,
    ));
  setState(() {});
  Navigator.pop(context);
  }
DbClass dbClass= DbClass.instance;

  @override
  Widget build(BuildContext context) {
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
                controller: questionController,
                hintText: "Enter your question",
                labelText: "Enter your question",
              ),
              CustomTextFromField(
                controller: option1Controller,
                hintText: "Enter your first option",
                labelText: "Enter your first option",
              ),
              CustomTextFromField(
                controller: option2Controller,
                hintText: "Enter your second option",
                labelText: "Enter your second option",
              ),
              CustomTextFromField(
                controller: option3Controller,
                hintText: "Enter your third option",
                labelText: "Enter your third option",
              ),
              CustomTextFromField(
                controller: option4Controller,
                hintText: "Enter your fourth option",
                labelText: "Enter your fourth option",
              ),
              CustomButton(
                onTap: ()
               {
                 updateData();
               },
                name: "Update Data",
              ),

            ],),
        ),
      ),
    );
  }
}
