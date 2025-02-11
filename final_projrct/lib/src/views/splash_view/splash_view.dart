import 'package:final_projrct/src/views/auth_view/sign_in_view/sign_in_view.dart';
import 'package:final_projrct/src/views/auth_view/sign_up_view/sign_up_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Future.delayed(Duration(seconds: 3),(){
     Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>SignInView()));
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Center(child: Image(image: AssetImage('assets/splash.png')),),
      ),
    );
  }
}

