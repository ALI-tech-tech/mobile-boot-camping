
import 'dart:typed_data';

import 'package:floor/floor.dart';

@Entity(tableName: 'company')
class Company {
  @PrimaryKey()
  final int? id;

  final String name;
  final String description;

  @ColumnInfo(name: 'work_type_id')
  final int workTypeId;

  @ColumnInfo(name: 'establish_date')
  final String establishDate;

  final String website;
  final Uint8List? image;

  @ColumnInfo(name: 'id_card')
  final Uint8List? idCard;

 

  Company({
     this.id,
    required this.name,
    required this.description,
    required this.workTypeId,
    required this.establishDate,
    required this.website,
    required this.image,
    required this.idCard,
    
  });
}