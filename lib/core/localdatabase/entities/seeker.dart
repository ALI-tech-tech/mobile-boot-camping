
import 'package:floor/floor.dart';

@Entity(tableName: 'seeker')
class Seeker {
  @PrimaryKey()
  final int id;

  @ColumnInfo(name: 'user_id')
  final int userId;

  final String image;
  final String descrip;

 

  Seeker({
    required this.id,
    required this.userId,
    required this.image,
    required this.descrip,
    
  });
}
