import 'package:flutter/foundation.dart';
import 'package:taskmanager/core/model/task.dart';
import 'package:taskmanager/helper/DB/localDB.dart';

import '../../helper/DB/dbtable.dart';

class TaskViewModel with ChangeNotifier {
  List<Task> allTasks=[];
  LocalDB localdb=LocalDB();

  TaskViewModel(){
    getTasks();
  }

  getTasks()async{
     List<Map<String, dynamic>> all= await localdb.getAllData(DBTable.TBL_TASK_NAME);
   print(all);
   allTasks=all.map((e) => Task.fromJson(e)).toList();
   notifyListeners();
  }

}