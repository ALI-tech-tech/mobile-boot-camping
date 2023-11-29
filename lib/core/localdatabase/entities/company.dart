import 'dart:typed_data';

import 'package:floor/floor.dart';

import 'user.dart';

@Entity(tableName: 'company')
class Company {
  @PrimaryKey()
  final int? id;
  @ForeignKey(entity: User, childColumns: ['user_id'], parentColumns: ['id'])
  @ColumnInfo(name: 'user_id')
  final int? Userid;

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

 

  Company( {
    this.id,
    required this.Userid,
    required this.name,
    required this.description,
    required this.workTypeId,
    required this.establishDate,
    required this.website,
    required this.image,
    required this.idCard,
  });
}
