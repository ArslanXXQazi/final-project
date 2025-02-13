import 'package:flutter/material.dart';

class ApiPractis extends StatefulWidget {
  const ApiPractis({super.key});

  @override
  State<ApiPractis> createState() => _ApiPractisState();
}

class _ApiPractisState extends State<ApiPractis> {
  @override


  Future<void> fetchData()async{

    final url=uri.parse("https://reqres.in/api/users?page=2");
    final response= http.get(url);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

      ],),
    );
  }
}
