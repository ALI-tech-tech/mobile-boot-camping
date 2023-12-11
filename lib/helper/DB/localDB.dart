import 'package:sqflite/sqflite.dart';
import 'Data_repo.dart';
import 'localdbconfig.dart';

class LocalDB implements DataRepo {
  Future<List<Map<String, dynamic>>> getAllData(String source) async {
    Database localDb = await LocalDBConfig.dbObject;
    return localDb.query(
      source,
    );
  }

  // getcount(String tble_name, String value) async {
  //   Database localDb = await LocalDBConfig.dbObject;
  //   //print(await localDb.rawQuery("select count(*) from ${tble_name} where $COL_type_NAME=${value} "));
  //   return await localDb.rawQuery(
  //       "select sum(${LocalDB.COL_AMOUNT_NAME}) from ${tble_name} where ${LocalDB.COL_type_NAME} like ? ",
  //       [value.toString()]);
  //   // return localDb.query(
  //   //   tble_name,
  //   // );
  // }

  Future<int> updateData(String source, Map<String, dynamic> data) async {
    Database localDb = await LocalDBConfig.dbObject;
    int id = data["id"];
    data.remove("id");
    return localDb.update(source, data, where: "id=?", whereArgs: [id]);
  }

  @override
  Future<int> removeData(String source, int id) async {
    Database localDb = await LocalDBConfig.dbObject;

    return localDb.delete(source, where: "id=?", whereArgs: [id]);
  }

  @override
  storeData(String source, Map<String, dynamic> data) async {
    Database localDb = await LocalDBConfig.dbObject;
    return localDb.insert(source, data);
  }
}
