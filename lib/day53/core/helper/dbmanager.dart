import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManager {
  Database? _db;

  static const String dbName = "MonyTracker.db";
  static const int dbVersion = 4;
  static const String TBL_INCOM_NAME = "income";
  //static const String TBL_EXPENSES_NAME = "expenses";

  static const String COL_ID_NAME = "id";
  static const String COL_AMOUNT_NAME = "amount";
  static const String COL_type_NAME = "type";

  Future<Database> get dbObject async {
    if (_db == null) _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = join(dbFolder, dbName);
    return openDatabase(
      "path",
      onCreate: (db, version) {
        db.execute("""
create table income(
  $COL_ID_NAME integer primary key autoincrement,
  $COL_AMOUNT_NAME integer not null,
  $COL_type_NAME text not null
  
)
""");
        print("created db");
      },
      version: dbVersion,
    );
  }

  Future<List<Map<String, dynamic>>> getAllData(String tble_name) async {
    Database localDb = await dbObject;
    return localDb.query(
      tble_name,
    );
  }

 getcount(String tble_name ,String value) async {
    Database localDb = await dbObject;
    //print(await localDb.rawQuery("select count(*) from ${tble_name} where $COL_type_NAME=${value} "));
    return await localDb.rawQuery("select sum(${DBManager.COL_AMOUNT_NAME}) from ${tble_name} where ${DBManager.COL_type_NAME} like ? ",[value.toString()]);
    // return localDb.query(
    //   tble_name,
    // );
  }

  Future<int> insertData(String tbl_name, Map<String, dynamic> data) async {
    Database localDb = await dbObject;
    return localDb.insert(tbl_name, data);
  }

  Future<int> updateData(String tbl_name, Map<String, dynamic> data) async {
    Database localDb = await dbObject;
    int id = data["id"];
    data.remove("id");
    return localDb.update(tbl_name, data, where: "id=?", whereArgs: [id]);
  }

  Future<int> deleteData(String tbl_name, int id) async {
    Database localDb = await dbObject;

    return localDb.delete(tbl_name, where: "id=?", whereArgs: [id]);
  }
}
