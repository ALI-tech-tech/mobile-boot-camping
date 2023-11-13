// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_practis/day53/core/helper/dbmanager.dart';

class Incom {
  int? id;
  int? amount;
  String? type;
  Incom({
    this.id,
    this.amount,
     this.type,
  });

  Incom.fromJSON(Map<String, dynamic> row) {
    amount = row['amount']??"";
    type=row["type"];
    
    id = row['id'] ?? null;
  }
Map<String, dynamic> toJSON() {
    return {
      DBManager.COL_ID_NAME: id,
      DBManager.COL_AMOUNT_NAME: amount,
      DBManager.COL_type_NAME: type,
      
    };
  }
}
