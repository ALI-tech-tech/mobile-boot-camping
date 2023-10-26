import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/features/view/start.dart';

Widget onbordingcontent({required BuildContext context, required IconData icon,required Headr,required String Content}){
  
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: Colors.amber,),
      SizedBox(height: 10,),
      Text(Headr,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
      SizedBox(height: 10,), 
      Text(Content,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),), 
    ],
  );
}