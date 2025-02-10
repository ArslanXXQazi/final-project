import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_projrct/src/dbhelper/dbhelper.dart';
import 'package:final_projrct/src/model/main_model.dart';

class InsertController extends GetxController {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();

  var isLoading = false.obs; // Reactive state for loading indicator

  Future<void> insertData() async {
    if (questionController.text.isNotEmpty &&
        option1Controller.text.isNotEmpty &&
        option2Controller.text.isNotEmpty &&
        option3Controller.text.isNotEmpty &&
        option4Controller.text.isNotEmpty) {

      isLoading.value = true; // Show loading indicator

      DbClass dbclass = DbClass.instance;
      MainModel model = MainModel(
        question: questionController.text,
        option1: option1Controller.text,
        option2: option2Controller.text,
        option3: option3Controller.text,
        option4: option4Controller.text,
      );

      int check = await dbclass.create(model);
      isLoading.value = false; // Hide loading indicator

      if (check == 1) {
        Get.snackbar("Success", "Data inserted successfully!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white);

        // Clear text fields
        questionController.clear();
        option1Controller.clear();
        option2Controller.clear();
        option3Controller.clear();
        option4Controller.clear();
      } else {
        Get.snackbar("Error", "Data insertion failed!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      Get.snackbar("Warning", "Please fill all fields",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.orange,
          colorText: Colors.white);
    }
  }
}
