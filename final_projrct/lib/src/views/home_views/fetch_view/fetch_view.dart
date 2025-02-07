// import 'package:final_projrct/src/controller/components/custom_Text.dart';
// import 'package:final_projrct/src/dbhelper/dbhelper.dart';
// import 'package:final_projrct/src/model/main_model.dart';
// import 'package:flutter/material.dart';
//
//
// class FetchView extends StatefulWidget {
//   const FetchView({super.key});
//
//   @override
//   State<FetchView> createState() => _FetchViewState();
// }
//
// class _FetchViewState extends State<FetchView> {
//   @override
//
//   void initState()
//   {
//     super.initState();
//     fetchData();
//   }
//
//   DbClass dbClass= DbClass.instance;
//
//   List <MainModel> data=[];
//
//   fetchData() async {
//     var fetchedDataList = await dbClass.read();
//     data = fetchedDataList.map((noteMap) {
//       return MainModel(
//         question: noteMap['question'],
//         option1: noteMap['option1'],
//         option2: noteMap['option2'],
//         option3: noteMap['option3'],
//         option4: noteMap['option4'],
//       );
//     }).toList();
//     setState(() {});
//   }
//
//   Widget build(BuildContext context) {
//     final height=MediaQuery.sizeOf(context).height;
//     final width=MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: CustomText(
//           text: 'Fetched Data ',
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//      body: ListView.builder(
//        itemCount: data.length,
//        itemBuilder: (context,index){
//          return Column(children: [
//            Container(
//              height: height*.1,
//              width: width*1,
//              color: Colors.red,
//              child: CustomText(text: data[index].question??""),
//            ),
//            SizedBox(height: height*.02,),
//            Container(
//              height: height*.1,
//              width: width*1,
//              child: CustomText(text: data[index].option1??""),
//            ),
//            SizedBox(height: height*.02,),
//            Container(
//              height: height*.1,
//              width: width*1,
//              child: CustomText(text: data[index].option2??""),
//            ),
//            SizedBox(height: height*.02,),
//            Container(
//              height: height*.1,
//              width: width*1,
//              child: CustomText(text: data[index].option3??""),
//            ),
//            SizedBox(height: height*.02,),
//            Container(
//              height: height*.1,
//              width: width*1,
//              child: CustomText(text: data[index].option4??""),
//            ),
//            SizedBox(height: height*.02,),
//          ],);
//        },
//      ),
//     );
//   }
// }

import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_container.dart';
import 'package:final_projrct/src/dbhelper/dbhelper.dart';
import 'package:final_projrct/src/model/main_model.dart';
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
          ? Center(child: CustomText(text: 'No Data Found '))  // Loading Indicator if no data
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
           return  Padding(
             padding: const EdgeInsets.symmetric(vertical: 20),
             child: Container(
               height: height*.3,
               width: width*1,
               color: Colors.red,
               child: Column(children: [
                 Row(children: [
                   CustomText(text: 'Question No '),
                   CustomText(text: '1'),
                 ],),
                 CustomText(text: 'jcakjc  ascnjlascas an caclak cacajsc acaca aajc akcj ack acackj c',fontWeight: FontWeight.bold,fontSize: 18,),
                 Row(children: [
                   Container(
                     height: height*.04,
                     width: width*.08,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                     child: Center(child: CustomText(text: 'A')),

                   ),
                   SizedBox(width: 20,),
                   Expanded(child: CustomText(text: 'cajlc a cajsc c ac a'))
                 ],),
                 SizedBox(height: 10,),
                 Row(children: [
                   Container(
                     height: height*.04,
                     width: width*.08,
                     decoration: BoxDecoration(
                       color: Colors.yellow,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Center(child: CustomText(text: 'A')),

                   ),
                   SizedBox(width: 20,),
                   Expanded(child: CustomText(text: 'cajlc a cajsc c ac a'))
                 ],),
                 Row(children: [
                   Container(
                     height: height*.04,
                     width: width*.08,
                     decoration: BoxDecoration(
                       color: Colors.yellow,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Center(child: CustomText(text: 'A')),

                   ),
                   SizedBox(width: 20,),
                   Expanded(child: CustomText(text: 'cajlc a cajsc c ac a'))
                 ],),
                 Row(children: [
                   Container(
                     height: height*.04,
                     width: width*.08,
                     decoration: BoxDecoration(
                       color: Colors.yellow,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Center(child: CustomText(text: 'A')),

                   ),
                   SizedBox(width: 20,),
                   Expanded(child: CustomText(text: 'cajlc a cajsc c ac a'))
                 ],),
               ],),
             ),
           );
             //Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.01),
          //   child: GestureDetector(
          //     onTap: (){
          //       // dbClass.deleteData(data[index].id!);
          //       // setState(() {
          //       //   data.removeAt(index);
          //       // });
          //     },
          //     child: Container(
          //
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Row(children: [
          //             CustomText(text: 'Question no '),
          //             CustomText(text: '1'),
          //           ],),
          //
          //           SizedBox(height: height * .01),
          //           CustomContainer(text:data[index].question??"",color: Colors.blue,fontcolor: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
          //           SizedBox(height: height * .02),
          //           CustomContainer(text: data[index].option1??""),
          //           SizedBox(height: height * .02),
          //           CustomContainer(text: data[index].option2??""),
          //           SizedBox(height: height * .02),
          //           CustomContainer(text: data[index].option3??""),
          //           SizedBox(height: height * .02),
          //           CustomContainer(text: data[index].option4 ??""),
          //           SizedBox(height: height * .01),
          //
          //
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}












