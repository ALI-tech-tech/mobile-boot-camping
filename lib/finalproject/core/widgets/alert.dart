


import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/features/view/subscriptionplan.dart';

 alertmovie(BuildContext context)async{
  return await showDialog(context: context, builder: (context)=>AlertDialog(
    shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            contentPadding: EdgeInsets.only(top: 10.0,bottom: 10.0),
    backgroundColor: Colors.amber,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.movie, size: 80, color: Colors.black,),
        SizedBox(height: 10,),
        Text("Subscribe Now to access",style: TextStyle(color: Colors.black),),
        Text("Premium content",style: TextStyle(color: Colors.black)),
        
        
      ],
      
    ),
    actions: [
      Center(
        child: ElevatedButton(
          
          onPressed: (){
            Navigator.pushNamed(context, Subscriptionplan.rout);
          }, child: Text("Subscribe Now"), style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              minimumSize: Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            
            ),),
      )
    ],
  ));
}