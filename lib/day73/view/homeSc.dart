import 'package:flutter/material.dart';
import 'package:flutter_practis/day73/view/aviable.dart';
import 'package:flutter_practis/day73/viewmodel/moviewmodel.dart';
import 'package:provider/provider.dart';

class HomeSc extends StatelessWidget {
  const HomeSc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Avilable(),));
        }, icon: Consumer<MoViewModel>(builder: (context, mvm, child) {
          return mvm.choose.length>0?Icon(Icons.favorite): Icon(Icons.heart_broken_sharp);
        },))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Selector<MoViewModel,int>(builder: (context, value, child) {
          return Text("$value");
        }, selector: (ctx, hvm)=> hvm.choose.length,),
          Consumer<MoViewModel>(builder: (context, mvm, child) {
            return TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
             mvm.multi(value);
            },
          );
          },),
          SizedBox(
            height: MediaQuery.of(context).size.height-500,
            width: MediaQuery.of(context).size.width-100,
            child: Consumer<MoViewModel>(builder: (context, mvm, child) {
              return ListView.builder(
              itemCount:mvm.choose.length ,
              itemBuilder: (context, index) {
                return ListTile(title: Text(mvm.choose[index].name!),
                subtitle:Text(mvm.choose[index].amount!.toString(), ) ,
                trailing: IconButton(onPressed: (){
                  mvm.removechoosen(mvm.choose[index]);
                }, icon: Icon(Icons.check_circle, color: Colors.green,)),
                );
              },);
            },)
          )
        ],
      ),
    );
  }
}