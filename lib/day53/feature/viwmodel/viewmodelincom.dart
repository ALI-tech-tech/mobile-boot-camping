import 'package:flutter_practis/day53/core/helper/dbmanager.dart';
import 'package:flutter_practis/day53/feature/model/Income.dart';


class IncomViewModel {
  DBManager dbManager=DBManager();
  List<Incom> allIncom=[];
  Future<List<Incom>> fetchAllIncome() async{
    List<Map<String,dynamic>>fetchdata=await dbManager.getAllData(DBManager.TBL_INCOM_NAME);
    allIncom=fetchdata.map((e) => Incom.fromJSON(e)).toList();
    return allIncom;
  }
  saveIncome(Incom income){ 
    return dbManager.insertData(DBManager.TBL_INCOM_NAME,income.toJSON() );
  }

  updateIncom(Incom incom){
    return dbManager.updateData(DBManager.TBL_INCOM_NAME, incom.toJSON());
  }
  deletIncom(int id){
    return dbManager.deleteData(DBManager.TBL_INCOM_NAME, id);
  }
  Future<int?> getcountincome(String value)async{
    //List<Map<String,dynamic>>fetchdata=await dbManager.getAllData(DBManager.TBL_INCOM_NAME);
    List<Map<String,dynamic>> v= await dbManager.getcount(DBManager.TBL_INCOM_NAME, value);
    int? d=v[0]["sum(${DBManager.COL_AMOUNT_NAME})"];
    return d;
  }
}