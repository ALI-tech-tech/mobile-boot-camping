import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/features/view/createaccount.dart';
import 'package:flutter_practis/finalproject/features/view/signin.dart';

class StartPage extends StatelessWidget {
  static String rout="/startpage";
   StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left:8.0,top: 270,right: 8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.movie,size: 200),
                  SizedBox(height: 10,),
                  Text("Start By Creating an Account",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
                  SizedBox(height: 10,),
                  Text("Start By Creating an Account",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),
                  SizedBox(height: 130,),
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, CreateAccount.rout);
                  }, child: Text("Create an Account" , style: TextStyle(color: Colors.black),)),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, SignIn.rout);
                    }, child: Text("SIGN IN", style: TextStyle(color: Colors.black),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}