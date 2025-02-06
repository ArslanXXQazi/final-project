import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_button.dart';
import 'package:final_projrct/src/controller/components/custom_text_from_field.dart';
import 'package:final_projrct/src/dbhelper/dbhelper.dart';
import 'package:final_projrct/src/model/main_model.dart';
import 'package:final_projrct/src/views/home_views/fetch_view/fetch_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {

  TextEditingController questionController=TextEditingController();
  TextEditingController option1Controller=TextEditingController();
  TextEditingController option2Controller=TextEditingController();
  TextEditingController option3Controller=TextEditingController();
  TextEditingController option4Controller=TextEditingController();
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
                  onTap: () async
                  {
                   if(questionController.text.isNotEmpty && option1Controller.text.isNotEmpty&&option2Controller.text.isNotEmpty&&option3Controller.text.isNotEmpty&&option4Controller.text.isNotEmpty)
                     {
                       DbClass dbclass=DbClass.instance;
                       MainModel model=MainModel(
                         question: questionController.text,
                         option1: option1Controller.text,
                         option2: option2Controller.text,
                         option3: option3Controller.text,
                         option4: option4Controller.text,
                       );
                     int check= await dbclass.create(model);
                      if (check==1)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Data inserted successfully!"))
                          );
                          questionController.clear();
                          option1Controller.clear();
                          option2Controller.clear();
                          option3Controller.clear();
                          option4Controller.clear();
                        }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Data Did not inserted"))
                        );
                      }
                     }
                   else
                     {
                       ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text("Please Enter Question & Options First!"))
                       );
                     }

                  },
                  name: "Insert Data",
              ),

          ],),
        ),
      ),
    );
  }
}
