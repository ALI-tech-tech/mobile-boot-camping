
import 'package:floor/floor.dart';

@Entity(tableName: 'experience')
class Experience {
  @PrimaryKey()
  final int id;

  @ColumnInfo(name: 'user_id')
  final int userId;

  @ColumnInfo(name: 'seeker_id')
  final int seekerId;

  @ColumnInfo(name: 'is_current_job')
  final bool isCurrentJob;

  @ColumnInfo(name: 'started_date')
  final String startDate;

  @ColumnInfo(name: 'end_date')
  final String endDate;

  @ColumnInfo(name: 'job_title')
  final String jobTitle;

  @ColumnInfo(name: 'company_name')
  final String companyName;

  final String description;

  Experience({
    required this.id,
    required this.userId,
    required this.seekerId,
    required this.isCurrentJob,
    required this.startDate,
    required this.endDate,
    required this.jobTitle,
    required this.companyName,
    required this.description,
  });
}
