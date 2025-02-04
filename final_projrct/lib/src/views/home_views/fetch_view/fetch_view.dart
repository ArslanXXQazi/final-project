import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:flutter/material.dart';


class FetchView extends StatelessWidget {
  const FetchView({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
