import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManaer {
  Database? _db;
  static const String dbName = "actorsm.db";
  static const int dbVersion = 4;
  static const String TBL_AWARD = "Awards";

  static const String COL_AWARD_ID = "id";
  static const String COL_AWARD_NAME = "name";
  static const String COL_ACTOR_ID = "actor_id";

/** start column ACTOR table */
  static const String TBL_ACTOR = "actor";
  static const String COL_ID = "id";
  static const String COL_NAME = "name";

  Future<Database> get dbObject async {
    if (_db == null) _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = join(dbFolder, dbName);
    return await openDatabase(
      dbPath,
      version: dbVersion,
      onCreate: (db, version) {
        db.execute("""
create table if not exists $TBL_ACTOR(
$COL_ID integer primary key autoincrement,
$COL_NAME varchar not null 

)
""");
        
      },
    onUpgrade: (db, oldVersion, newVersion) {
      db.execute("""
create table if not exists $TBL_AWARD(
$COL_AWARD_ID integer primary key autoincrement,
$COL_AWARD_NAME varchar not null ,
$COL_ACTOR_ID INTEGER not null,
FOREIGN KEY($COL_ACTOR_ID) REFERENCES $TBL_ACTOR($COL_ID)

)
""");
    },);
  }

  Future<List<Map<String, dynamic>>> fetch(String tble_name) async {
    Database localDb = await dbObject;
    return localDb.query(
      tble_name,
    );
  }
  Future<List<Map<String, dynamic>>> fetchbyid(String tble_name, int id) async {
    Database localDb = await dbObject;
    return localDb.query(
      tble_name, where: "$COL_ACTOR_ID=?", whereArgs: [id]
    );
  }

  Future<int> insert(String tbl_name, Map<String, dynamic> data) async {
    Database localDb = await dbObject;
    
    return localDb.insert(tbl_name, data);
  }

  Future<int> update(String tbl_name, Map<String, dynamic> data) async {
    Database localDb = await dbObject;
    int id = data["id"];
    data.remove("id");
    return localDb.update(tbl_name, data, where: "id=?", whereArgs: [id]);
  }

  Future<int> delete(String tbl_name, int id) async {
    Database localDb = await dbObject;

    return localDb.delete(tbl_name, where: "id=?", whereArgs: [id]);
  }

  addAll(String tbl_Name, List<Map<String,dynamic>> data)async{
    Database localDb=await dbObject;
    Batch b= localDb.batch();
    for ( var i =0  ; i <data.length ; i++ ){
      b.insert(tbl_Name,data[i] );
    }
    
    b.commit();
  }
}
