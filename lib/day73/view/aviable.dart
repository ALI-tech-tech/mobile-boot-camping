import 'package:flutter/material.dart';
import 'package:flutter_practis/day73/viewmodel/moviewmodel.dart';
import 'package:provider/provider.dart';

class Avilable extends StatelessWidget {
  const Avilable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<MoViewModel>(builder: (context, mvm, child) {
        return ListView.builder(
              itemCount:mvm.avilable.length ,
              itemBuilder: (context, index) {
                return ListTile(title: Text(mvm.avilable[index].name!),
                subtitle:Text(mvm.avilable[index].cost!.toString(), ) ,
                trailing: IconButton(onPressed: (){
                  if (mvm.choose.contains(mvm.avilable[index])) {
                    mvm.removechoosen(mvm.avilable[index]);
                  }else{
                    mvm.addchoosen(mvm.avilable[index]);
                  }
                  
                }, icon: Icon(Icons.check_circle, color:mvm.choose.contains(mvm.avilable[index])? Colors.green:Colors.grey,)),
                );
              },);
      },),
    );
  }
}