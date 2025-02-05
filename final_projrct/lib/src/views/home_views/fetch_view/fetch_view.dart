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
  @override

  void initState()
  {
    super.initState();
    fetchData();
  }

  DbClass dbClass= DbClass.instance;

  List <MainModel> data=[];

  fetchData() async {
    var fetchedDataList = await dbClass.read();
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
  }

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
     body: ListView.builder(
       
     ),
    );
  }
}
