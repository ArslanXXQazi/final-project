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
      body: data.isEmpty
          ? Center(child: CustomText(text: 'No Data Found '))  // Loading Indicator if no data
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            height: height*.4,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                    height: height *.05,
                    width: width * 1,
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: data[index].question ?? "")
                      ],)
                ),
                SizedBox(height: height * .01),
                Container(
                  height: height * .05,
                  width: width * 1,
                  child: CustomText(text: data[index].option1 ?? ""),
                ),
                SizedBox(height: height * .01),
                Container(
                  height: height * .05,
                  width: width * 1,
                  child: CustomText(text: data[index].option2 ?? ""),
                ),
                SizedBox(height: height * .01),
                Container(
                  height: height * .05,
                  width: width * 1,
                  child: CustomText(text: data[index].option3 ?? ""),
                ),
                SizedBox(height: height * .01),
                Container(
                  height: height * .05,
                  width: width * 1,
                  child: CustomText(text: data[index].option4 ?? ""),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}












