import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_button.dart';
import 'package:final_projrct/src/controller/components/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sign_in_view/sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CustomText(text: 'Sign Up',fontWeight: FontWeight.bold,fontSize: 18,),
            SizedBox(height: height*.01,),
            CustomTextFormField(
                hintText: 'Enter your email',
                lableText: 'Enter your email',
                controller: emailController
            ),
            SizedBox(height: height*.02,),
            CustomTextFormField(
                hintText: 'Enter your Password',
                lableText: 'Enter your Password',
                controller: passwordController
            ),
            SizedBox(height: height*.02,),
            Center(
              child: CustomButton(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignInView()));
                  },
                  name: "Sign up")
            ),
            SizedBox(height: height*.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CustomText(text: "Already have account ?",fontSize: 13,),
              TextButton(onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignInView()));
              },
                  child: CustomText(text: 'Sign in',color: Colors.blue,)),
            ],)
        ],),
      ),
    );
  }
}
