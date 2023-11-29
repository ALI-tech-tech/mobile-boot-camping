
import 'dart:typed_data';

import 'package:floor/floor.dart';

import 'user.dart';

@Entity(tableName: 'seeker')
class Seeker {
  @PrimaryKey()
  final int? id;
  @ForeignKey(entity: User, childColumns: ['user_id'], parentColumns: ['id'])

  @ColumnInfo(name: 'user_id')
  final int userId;

  final Uint8List? image;
  final String descrip;

 

  Seeker({
     this.id,
    required this.userId,
    required this.image,
    required this.descrip,
    
  });
}
