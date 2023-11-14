import 'dart:math';

import 'package:flutter_practis/day54/constant/filespath.dart';
import 'package:flutter_practis/day54/core/model/Actors.dart';
import 'package:flutter_practis/day54/core/model/Awsrds.dart';
import 'package:flutter_practis/day54/core/viewmodel/ActorsViewModel.dart';
import 'package:flutter_practis/day54/helper/dbmanager.dart';
import 'package:flutter_practis/day54/helper/filemanager.dart';

class AwardsViewModel {
  List<Awards> _allAwards = [];
  FileMnager flm = FileMnager();
  DBManaer db = DBManaer();
  addfromfile() async {
    ActorsViewModel avm = ActorsViewModel();
    List<Actors> act = await avm.getAllActors();
    List<dynamic> li = await flm.readJson(FilesPath.AWAREDS);
    List<Map<String, dynamic>> li2 =
        li.map((e) => e as Map<String, dynamic>).toList();
    li2.forEach((element) {
      element[DBManaer.COL_ACTOR_ID] = act[Random().nextInt(act.length)].id;
    });

    db.addAll(DBManaer.TBL_AWARD, li2);
  }

  Future<List<Awards>> getAllAwards() async {
    List<Map<String, dynamic>> v = await db.fetch(DBManaer.TBL_AWARD);
    _allAwards = v.map((e) => Awards.fromJson(e)).toList();
    return _allAwards;
  }

  Future<List<Awards>> getAwards(int id) async {
    List<Map<String, dynamic>> v = await db.fetchbyid(DBManaer.TBL_AWARD, id);
    _allAwards = v.map((e) => Awards.fromJson(e)).toList();
    print(_allAwards);
    return _allAwards;
  }

  Future<int?> AddAward(Map<String,dynamic> aw)async{
    return await db.insert(DBManaer.TBL_AWARD, aw);

  }
}
