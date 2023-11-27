import 'package:floor/floor.dart';

import '../core/localdatabase/database/app_database.dart';

class DBHelper {
  static late AppDatabase database;

  static initDatabase() async {
    
    database = await $FloorAppDatabase.databaseBuilder('jobsfinder.db').build();
  }
}
