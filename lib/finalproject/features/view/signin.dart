import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/TextFieldform.dart';

import 'package:flutter_practis/finalproject/core/widgets/backgroundpages.dart';
import 'package:flutter_practis/finalproject/features/view/moviepage.dart';
import 'package:icons_plus/icons_plus.dart';

class SignIn extends StatefulWidget {
  static String rout = "/signin";
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> gk = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        title: Text("Sign In your Account"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            mainBackground(context),
            Container(
              margin: EdgeInsets.only(top: 150, left: 30, right: 20),
              child: Form(
                  key: gk,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldForm(controller: email, lable: "Email"),
                      SizedBox(
                        height: 8,
                      ),
                      TextFieldForm(
                          controller: password, lable: "Password", pass: true),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text("forgot your password?")],),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(400, 50)),
                          onPressed: () {
                            Navigator.pushNamed(context, MovieHomepage.rout);
                          },
                          child: Text("Sign In")),
                     
                    ],
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 400,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign up with social media",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Logo(Logos.google),
                      SizedBox(
                        width: 8,
                      ),
                      Logo(Logos.facebook_logo),
                      SizedBox(
                        width: 8,
                      ),
                      Logo(Logos.twitter),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height - 250,
                left: 20,
                child: Row(
                  children: [
                    Text("Not a member?"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.amber),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
