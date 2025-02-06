import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CustomText(text: 'Sign Up'),
            SizedBox(height: height*.02,),
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
              child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(width*1, height*.07),
                  ),
                  child: CustomText(text: 'Sign Up'),
              ),
            )
        ],),
      ),
    );
  }
}
