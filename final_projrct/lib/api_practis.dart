import 'dart:convert';

import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPractis extends StatefulWidget {
  const ApiPractis({super.key});

  @override
  State<ApiPractis> createState() => _ApiPractisState();
}

class _ApiPractisState extends State<ApiPractis> {
  @override


  String data1='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData()async{

    final url=Uri.parse("https://reqres.in/api/users?page=2");
    final response= await http.get(url);

    if (response.statusCode==200)
      {
        final data= json.decode(response.body);
        data1=data['page'];
        setState(() {});
      }


  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: data1),
      ],),
    );
  }
}
