

import 'package:final_projrct/src/dbhelper/dbhelper.dart';
import 'package:final_projrct/src/model/main_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FetchController extends GetxController{

  DbClass dbClass=DbClass.instance;
  var dataList = <MainModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async{
    try{
      var fetchDataList=await dbClass.read();
      dataList.value=fetchDataList.map((noteMap){
        return MainModel(
            id: noteMap['id'],
          question: noteMap['question'],
          option1: noteMap['option1'],
          option2: noteMap['option2'],
          option3: noteMap['option3'],
          option4: noteMap['option4'],
        );
      }).toList();
    }
    catch (e){
      Get.snackbar(
          'Eroor',"Failed to fetch data: $e",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
      );
    }
  }


  void deleteData(int id) async {
    await dbClass.deleteData(id);
    dataList.removeWhere((element) => element.id == id);

  }

}