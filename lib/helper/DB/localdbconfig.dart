import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dbtable.dart';

class LocalDBConfig {
  static  Database? _db;
  LocalDBConfig? _ldb;
  static const String dbName = "TaskManager.db";
  static const int dbVersion = 1;


 


  static Future<Database> get dbObject async {
    if (_db == null) _db = await initDatabase();
    return _db!;
  }

 static Future<Database> initDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = join(dbFolder, dbName);
    return openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute("""
create table ${DBTable.TBL_MEMBER_NAME}(
  ${DBTable.COL_ID_MEMBER} integer primary key autoincrement,
  ${DBTable.COL_NAME_MEMBER} TEXT not null,
  ${DBTable.COL_SPECIAL_MEMBER} text not null
)
""");
        await db.execute("""
create table ${DBTable.TBL_TASK_NAME}(
  ${DBTable.COL_ID_TASK} integer primary key autoincrement,
  ${DBTable.COL_TITLE_TASK} TEXT not null,
  ${DBTable.COL_BODY_TASK} TEXT not null,
  ${DBTable.COL_DATE_TASK} text not null,
  ${DBTable.COL_IS_DONE_TASK} integer not null,
  ${DBTable.COL_TIME_TO_DO_TASK} integer not null
)
""");
        await db.execute("""
create table ${DBTable.TBL_TASK_MEMBER_NAME}(
  ${DBTable.COL_ID_TASK_MEMBER} integer primary key autoincrement,
  ${DBTable.COL_FID_MEMBER} integer not null,
  ${DBTable.COL_FID_TASK} integer not null,
  FOREIGN KEY (${DBTable.COL_FID_MEMBER})  REFERENCES ${DBTable.TBL_MEMBER_NAME}(id) ON DELETE CASCADE,
  FOREIGN KEY (${DBTable.COL_FID_TASK})  REFERENCES ${DBTable.TBL_TASK_NAME}(id) ON DELETE CASCADE
)
""");

await db.execute("""
insert into  ${DBTable.TBL_MEMBER_NAME}  
 VALUES
  (null, 'Ali', 'IT'),
  (null, 'ahmed', 'Designer'),
  (null, 'salem', 'CS')
""");
        print("created db");
      },
      version: dbVersion,
      
    );
  }

}