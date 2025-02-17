// import 'dart:convert';
//
// import 'package:final_projrct/src/controller/components/custom_Text.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ApiPractis extends StatefulWidget {
//   const ApiPractis({super.key});
//
//   @override
//   State<ApiPractis> createState() => _ApiPractisState();
// }
//
// class _ApiPractisState extends State<ApiPractis> {
//   @override
//
//
//   int  data1=0;
//   int perPage=0;
//   int total=0;
//   int totalPages=0;
//
//   List<dynamic> dataList=[];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData()async{
//
//     final url=Uri.parse("https://reqres.in/api/users?page=2");
//     final response= await http.get(url);
//
//     if (response.statusCode==200)
//       {
//         final data= json.decode(response.body);
//         data1=data['page'];
//         perPage=data['per_page'];
//         total=data['total'];
//         totalPages=data['total_pages'];
//         dataList=data['data'];
//         setState(() {});
//       }
//     else
//       {
//         print('error');
//       }
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:   AppBar(
//         centerTitle: true,
//         title:  BoldText(text: 'API VIEW',color: Colors.green,),
//       ),
//       body:  ListView.builder(
//         itemCount: dataList.length,
//         itemBuilder: (context, index){
//           return ListTile(
//             leading: CircleAvatar(
//             backgroundImage: NetworkImage(dataList[index]['avatar']),
//             ),
//             title: CustomText(text: dataList[index]['first_name']),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomText(text: dataList[index]['last_name']),
//               ],),
//             trailing: CustomText(text: dataList[index]['email'],fontSize: 12,color: Colors.red,),
//
//           );
//         },
//       )
//       // Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: [
//       //       BoldText(text: 'Page = $data1'),
//       //       SizedBox(height: 10,),
//       //       BoldText(text: 'per_Page = $perPage'),
//       //       SizedBox(height: 10,),
//       //       BoldText(text: 'total = $total'),
//       //       SizedBox(height: 10,),
//       //       BoldText(text: 'total pages = $totalPages'),
//       //   ],),
//       // ),
//     );
//   }
// }
//
//

import 'dart:convert';

import 'package:final_projrct/model/userdata_model.dart';
import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ApiPractis extends StatefulWidget {
  const ApiPractis({super.key});

  @override
  State<ApiPractis> createState() => _ApiPractisState();
}

class _ApiPractisState extends State<ApiPractis> {
  @override

  List<UserModel> userList=[];

  Future<void> fetchData()
  async{
    final url =Uri.parse("https://reqres.in/api/users?page=2");
    final response= await http.get(url);
    if(response.statusCode==200)
      {
        final data=json.decode(response.body);
        setState(() {
          userList=(data['data']as List).
          map((user)=>UserModel.fromMap(user)).toList();
        });
      }
    else
      {
        print('Errrorororroororo');
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, intdex){
        return ListTile(
          leading: Row(
            children: [
              CustomText(text: userList[intdex].id.toString()),
              CircleAvatar(
                backgroundImage: NetworkImage(userList[intdex].avatar),
              ),
            ],
          ),
          title: CustomText(text: userList[intdex].firstName??"NO NAME AVILIBLE"),
          subtitle: Column(
            children: [
              CustomText(text: userList[intdex].lastName),
              CustomText(text: userList[intdex].email),
            ],
          ),
        );
      },
    );
  }
}

