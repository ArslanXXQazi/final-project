import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_button.dart';
import 'package:final_projrct/src/controller/components/custom_container.dart';
import 'package:final_projrct/src/controller/components/select_container.dart';
import 'package:final_projrct/src/dbhelper/dbhelper.dart';
import 'package:final_projrct/src/model/main_model.dart';
import 'package:final_projrct/src/views/home_views/update_data/update_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class FetchView extends StatefulWidget {
  const FetchView({super.key});

  @override
  State<FetchView> createState() => _FetchViewState();
}

class _FetchViewState extends State<FetchView> {
  DbClass dbClass = DbClass.instance;
  List<MainModel> data = [];
  PageController pageController = PageController();
  int selected=0;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: CustomText(
          text: 'Questions ',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: data.isEmpty
          ? Center(child: CustomText(text: 'No Data Found')) // Loading Indicator if no data
          : Center(
            child: Container(
              height: height*.45,
              child: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .02),
                child: GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: CustomText(text: 'Are you sure to want these changes'),
                          actions: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      bool result = await Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => UpdateData(
                                            id: data[index].id!,
                                            question: data[index].question ?? "",
                                            option1: data[index].option1 ?? "",
                                            option2: data[index].option2 ?? "",
                                            option3: data[index].option3 ?? "",
                                            option4: data[index].option4 ?? "",
                                          ),
                                        ),
                                      );
                                      if (result == true) {
                                        fetchData();
                                      }
                                    },
                                    name: 'Update',
                                  ),
                                ),
                                SizedBox(width: width * .02),
                                Expanded(
                                  child: CustomButton(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await dbClass.deleteData(data[index].id!);
                                      setState(() {
                                        data.removeAt(index);
                                      });
                                      Get.snackbar("Deleted", "Data deleted successfully!",
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white
                                      );
                                    },
                                    name: 'Delete',
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: width * 1,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * .02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              BoldText(
                                text: 'Question No : ',
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                              BoldText(text: '${index + 1}',fontWeight: FontWeight.bold,), // Displaying the question number
                            ],
                          ),
                          SizedBox(height: height * .01),
                          BoldText(
                            text: data[index].question ?? "",color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          SizedBox(height: height * .02),
                          Row(
                            children: [
                              SelectContainer(onTap: () {
                                selected=1;
                                setState(() {});
                              },
                                text: "A",
                                backColor: selected==1?Colors.red:Colors.grey.shade200,
                                fontColor: selected==1?Colors.white:Colors.black,
                              ),
                              SizedBox(width: 20),
                              Expanded(child: CustomText(text: data[index].option1 ?? "",color: Colors.white,))
                            ],
                          ),
                          SizedBox(height: height * .01),
                          Row(
                            children: [
                              SelectContainer(onTap: () {
                                selected=2;
                                setState(() {});
                              },
                                  text: "B",
                                backColor: selected==2?Colors.red:Colors.grey.shade200,
                                fontColor: selected==2?Colors.white:Colors.black,
                              ),
                              SizedBox(width: 20),
                              Expanded(child: CustomText(text: data[index].option2 ?? "",color: Colors.white,))
                            ],
                          ),
                          SizedBox(height: height * .01),
                          Row(
                            children: [
                              SelectContainer(onTap: () {
                                selected=3;
                                setState(() {});
                              }, text: "C",
                                backColor: selected==3?Colors.red:Colors.grey.shade200,
                                fontColor: selected==3?Colors.white:Colors.black,
                              ),
                              SizedBox(width: 20),
                              Expanded(child: CustomText(text: data[index].option3 ?? "",color: Colors.white,))
                            ],
                          ),
                          SizedBox(height: height * .01),
                          Row(
                            children: [
                              SelectContainer(onTap: () {
                                selected=4;
                                setState(() {});
                              }, text: "D",
                                backColor: selected==4?Colors.red:Colors.grey.shade200,
                                fontColor: selected==4?Colors.white:Colors.black,),
                              SizedBox(width: 20),
                              Expanded(child: CustomText(text: data[index].option4 ?? "",color: Colors.white,))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
                      },
                    ),
            ),
          ),
    );
  }
}