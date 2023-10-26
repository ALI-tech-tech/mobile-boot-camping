import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/TextFieldform.dart';

import 'package:flutter_practis/finalproject/core/widgets/backgroundpages.dart';
import 'package:flutter_practis/finalproject/features/view/otp.dart';
import 'package:icons_plus/icons_plus.dart';

class CreateAccount extends StatefulWidget {
  static String rout = "/createaccount";
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  GlobalKey<FormState> gk=GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController repassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        title: Text("Create Account"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            mainBackground(context),
            Container(
              margin: EdgeInsets.only(top: 130,left: 30,right: 20),
              child: Form(
                key: gk,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldForm(controller: email,lable: "Email"),
                  SizedBox(height: 8,),
                  TextFieldForm(controller: password,lable: "Password", pass: true),
                  SizedBox(height: 8,),
                  TextFieldForm(controller: repassword,lable: "Re-Password", pass: true,),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(400, 50)
                    ),
                    onPressed: (){
                      //Navigator.pushNamed(context, OTP.rout);
                    }, child: Text("Create an Account")),
                    SizedBox(height: 8,),
                  Text("By sign in ...."),
                  SizedBox(height: 8,),
                  Text("policy & Terms",style: TextStyle(color: Colors.amber),),
                ],
              )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height-300,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign up with social media", style: TextStyle(color: Colors.white),),
                      SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Logo(Logos.google),
                      SizedBox(width: 8,),
                      Logo(Logos.facebook_logo),
                      SizedBox(width: 8,),

                      Logo(Logos.twitter),
                    ],
                  )
                ],
              ),
            ),
         
         
            Positioned(
              top: MediaQuery.of(context).size.height-100,
              left: 20,
              child: Row(children: [
              Text("Already have an account?"),
              SizedBox(width: 5,),
              Text("Sign In", style: TextStyle(color: Colors.amber),)
            ],))
          ],
        ),
      ),
    ));
  }
}
