import 'package:final_projrct/src/controller/components/custom_Text.dart';
import 'package:final_projrct/src/controller/components/custom_text_form_field.dart';
import 'package:final_projrct/src/views/auth_view/sign_up_view/sign_up_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignInView> {

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
            CustomText(text: 'Log In',fontWeight: FontWeight.bold,fontSize: 18,),
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
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(width*1, height*.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
                child: CustomText(text: 'Log in',color: Colors.white,fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(height: height*.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "Don't have an account ?",fontSize: 13,),
                TextButton(onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignUpView()));
                },
                    child: CustomText(text: 'Sign Up',color: Colors.blue,)),
              ],)
          ],),
      ),
    );
  }
}
