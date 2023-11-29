import 'package:jobsfinder/helpers/db_helper.dart';

import '../../core/localdatabase/entities/work_type.dart';

class WorkTypeViewModel {
  List<WorkType> all=[];

  readAllWorkType()async{
    all=await DBHelper.database.worktypedao.getAllWorkTypes();
  }

  addNewWorkType(WorkType wt)async{
    await DBHelper.database.worktypedao.insertWorkType(wt);
  }

  getIdWorkType(String type)async{
    await readAllWorkType();
    return all.firstWhere((element) => element.name==type).id;
  }
}