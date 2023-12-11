import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/core/viewmodel/memberviewmodel.dart';
import 'package:taskmanager/core/viewmodel/taskviewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TaskViewModel>(builder: (context, mVM, child) {
        return  ListView.builder(
        itemCount: mVM.allTasks.length,
        itemBuilder: (context, index) {
          return Card(
            color: mVM.allTasks[index].isDone ==1 ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(mVM.allTasks[index].title!),
                      Text(mVM.allTasks[index].date!),
                    ],
                  )
                  ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  child: Text(mVM.allTasks[index].body!),
                ) 

              ],
            ),
          );
        },);
   
      },)
   
    );
  }
}