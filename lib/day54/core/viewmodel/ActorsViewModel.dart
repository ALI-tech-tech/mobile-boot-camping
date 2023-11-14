import 'package:flutter_practis/day54/constant/filespath.dart';
import 'package:flutter_practis/day54/core/model/Actors.dart';
import 'package:flutter_practis/day54/helper/dbmanager.dart';
import 'package:flutter_practis/day54/helper/filemanager.dart';

class ActorsViewModel {
  

  List<Actors> _allActors=[];
  FileMnager flm=FileMnager();
  DBManaer db=DBManaer();
  addfromfile()async{
    //flm.readJson(FilesPath.ACTORS);
    List<dynamic> li=await flm.readJson(FilesPath.ACTORS);
    List<Map<String,dynamic>> li2=li.map((e) => e as Map<String,dynamic>).toList();
    db.addAll(DBManaer.TBL_ACTOR, li2);
  }

  Future<List<Actors>> getAllActors()async{

    List<Map<String,dynamic>> v= await db.fetch(DBManaer.TBL_ACTOR);
  _allActors=v.map((e) => Actors.fromJson(e)).toList();
  return _allActors;
  }

  Future<int?> AddActor(Map<String,dynamic> act)async{
    return await db.insert(DBManaer.TBL_ACTOR, act);

  }
}