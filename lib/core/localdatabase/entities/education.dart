
import 'package:floor/floor.dart';

import 'seeker.dart';

@Entity(tableName: 'education')
class Education {
  @PrimaryKey()
  final int? id;
  @ForeignKey(entity: Seeker, childColumns: ['seeker_id'], parentColumns: ['id'])
  @ColumnInfo(name: 'seeker_id')
  final int seekerId;

  @ColumnInfo(name: 'degree_name')
  final String degreeName;

  final String major;

  @ColumnInfo(name: 'insta_univer_name')
  final String instituteUniversityName;

  @ColumnInfo(name: 'started_date')
  final String startDate;

  @ColumnInfo(name: 'completion_date')
  final String completionDate;

  Education({
     this.id,
    required this.seekerId,
    required this.degreeName,
    required this.major,
    required this.instituteUniversityName,
    required this.startDate,
    required this.completionDate,
  });
}
