

import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_button.dart';
import 'package:final_projrct/src/controller/components/custom_container.dart';
import 'package:final_projrct/src/controller/components/select_container.dart';
import 'package:final_projrct/src/dbhelper/dbhelper.dart';
import 'package:final_projrct/src/model/main_model.dart';
import 'package:final_projrct/src/views/home_views/update_data/update_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FetchView extends StatefulWidget {
  const FetchView({super.key});

  @override
  State<FetchView> createState() => _FetchViewState();
}

class _FetchViewState extends State<FetchView> {
  DbClass dbClass = DbClass.instance;
  List<MainModel> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    try {
      var fetchedDataList = await dbClass.read();
      print("Fetched data from DB: $fetchedDataList"); // Debugging line
      if (fetchedDataList.isEmpty) {
        print("No data found in the database.");
      }
      data = fetchedDataList.map((noteMap) {
        return MainModel(
          question: noteMap['question'],
          option1: noteMap['option1'],
          option2: noteMap['option2'],
          option3: noteMap['option3'],
          option4: noteMap['option4'],
          id: noteMap['id']
        );
      }).toList();
      setState(() {});
    } catch (e) {
      print("Error while fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: CustomText(
          text: 'Questions ',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: data.isEmpty
          ? Center(child: CustomText(text: 'No Data Found'))  // Loading Indicator if no data
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
           return  Padding(
             padding: EdgeInsets.symmetric(horizontal: width*.03,vertical: height*.02),
             child: GestureDetector(
               onLongPress: () {
                 showDialog(context: context,
                     builder: (BuildContext context){
                    return AlertDialog(
                      title: CustomText(text: 'Are you sure to want these changes'),
                      actions: [
                        Row(children: [
                          Expanded(child: CustomButton(
                            onTap: () async
                            {
                              Navigator.pop(context);
                              bool  result = await Navigator.push(context, CupertinoPageRoute(builder: (context)=>UpdateData(
                                    //id: data[index].id!,
                                    question: data[index].question??"",
                                    option1: data[index].option1??"",
                                    option2: data[index].option2??"",
                                    option3: data[index].option3??"",
                                    option4: data[index].option4??"",
                                )));
                                if(result==true)
                                  {
                                    fetchData();
                                  }
                            },
                            name: 'Update',
                          )),
                          SizedBox(width: width*.02,),
                          Expanded(child: CustomButton(
                            onTap: () async
                            {
                              await dbClass.deleteData(data[index].id!);
                                     setState(() {
                                      data.removeAt(index);
                              });
                                     Navigator.pop(context);
                            },
                            name: 'Delete',color: Colors.red,
                          )),
                        ],)
                      ],
                    );
                     }
                 );
               },
               child: Container(
                 height: height*.35,
                 width: width*1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                 child: Padding(
                   padding:  EdgeInsets.symmetric(horizontal: width*.02),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     Row(children: [
                       CustomText(text: 'Question No ',color: Colors.blue,fontWeight: FontWeight.bold,),
                       CustomText(text: data[index].),
                     ],),
                     SizedBox(height: height*.01,),
                     CustomText(text:data[index].question??"",fontWeight: FontWeight.bold,fontSize: 18,),
                       SizedBox(height: height*.02,),
                     Row(children: [
                      SelectContainer(onTap: (){}, text: "A"),
                       SizedBox(width: 20,),
                       Expanded(child: CustomText(text: data[index].option1??""))
                     ],),
                       SizedBox(height: height*.01,),
                     Row(children: [
                       SelectContainer(onTap: (){}, text: "B"),
                       SizedBox(width: 20,),
                       Expanded(child: CustomText(text: data[index].option2??""))
                     ],),
                       SizedBox(height: height*.01,),
                     Row(children: [
                       SelectContainer(onTap: (){}, text: "C"),
                       SizedBox(width: 20,),
                       Expanded(child: CustomText(text: data[index].option3??""))
                     ],),
                       SizedBox(height: height*.01,),
                     Row(children: [
                       SelectContainer(onTap: (){}, text: "D"),
                       SizedBox(width: 20,),
                       Expanded(child: CustomText(text: data[index].option4??""))
                     ],),
                   ],),
                 ),
               ),
             ),
           );
        },
      ),
    );
  }
}
