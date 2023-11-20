

import 'package:floor/floor.dart';
import 'package:flutter_practis/day57/database/app_database.dart';

class DBHelper {
  static late AppDatabase database;

  static initDatabase() async {
    Callback callback = Callback(
      onCreate: (db,_){
        List<String> dep = ['IT','CS','D1','D2'];
        String result = List.generate(dep.length,
                (index) => '(${index + 1}, "${dep[index]}")').join(',');
        db.execute('INSERT INTO Department VALUES $result');
      }
    );
    database = await $FloorAppDatabase
        .databaseBuilder('bootcamp_database.db')
        .addCallback(callback)
        .build();
  }
}