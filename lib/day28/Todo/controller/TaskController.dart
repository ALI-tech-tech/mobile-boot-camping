import 'package:flutter_practis/day28/Todo/model/task.dart';
import 'package:flutter_practis/day28/Todo/view/ViewTask.dart';

class TaskController {
  late Task task;
  late ViewTask vtask;
  TaskController({required this.task,required this.vtask });
  List<Task> tasks=[];

  addTask({required String title,required String Descripton} ){
    Task k=Task(title: title,description: Descripton);
    tasks.add(k);
  }

  editTask({required String oldtitle,required String newTitle,required String newDescription}){
    //Task newt=Task(title: newTitle,description: newDescription);
    tasks.forEach((element) {
      if (element.title==oldtitle) {
        element.title=newTitle;
        element.description=newDescription;
      }
    }); 
  }

  removeTask({required String? title}){
    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].title==title) {
        tasks.remove(tasks[i]);
      }
    }
  }

}