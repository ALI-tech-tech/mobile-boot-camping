import 'package:flutter_practis/day54/helper/dbmanager.dart';
import 'package:sqflite/sqflite.dart';

class DBCRUD {
  DBManaer db = DBManaer();

  /** add to table */
  Future<int> insert(String tbl_name, Map<String, dynamic> row,
      {String? foreignTable = null,
      String? foreignkey = null,
      List<Map<String, dynamic>>? sub_rows = null}) async {
    Database localDB = await db.dbObject;
    int id = -1;
    id = await localDB.insert(tbl_name, row);
    if (foreignTable != null) {
      insertToForeignTable(foreignTable, foreignkey!, id, sub_rows!);
    }
    return id;
  }

  Future<int> insertToForeignTable(String foreignTable, String foreignkey,
      int id, List<Map<String, dynamic>> sub_rows) async {
    Database localDB = await db.dbObject;

    sub_rows.forEach((element) {
      element[foreignkey] = id;
      localDB.insert(foreignTable, element);
    });

    return id;
  }

  /** delete from table */
  Future<int> delete(String sql) async {
    Database localDB = await db.dbObject;
    return localDB.rawDelete(sql);
  }

  /** get from table */
  Future<List<Map<String, dynamic>>> fetch(String sql) async {
    Database localDB = await db.dbObject;
    return localDB.rawQuery(sql);
  }

  @override
  Future<int> update(String tableName, Map<String, dynamic> row,
      String whereClause, List<dynamic> whereArgs) async {
    // Implementation specific to the images table
    Database localDB = await db.dbObject;
    return localDB.update(tableName, row,
        where: whereClause, whereArgs: whereArgs);
  }
}
