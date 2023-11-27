
import 'package:floor/floor.dart';

@Entity(tableName: 'job_post')
class JobPost {
  @PrimaryKey()
  final int id;

  @ColumnInfo(name: 'company_id')
  final int companyId;

  @ColumnInfo(name: 'work_type_id')
  final int workTypeId;

  @ColumnInfo(name: 'companyName_hidden')
  final String companyNameHidden;

  @ColumnInfo(name: 'created_date')
  final String createdDate;

  @ColumnInfo(name: 'job_desc')
  final String jobDescription;

  @ColumnInfo(name: 'job_location')
  final String jobLocation;

  @ColumnInfo(name: 'is_active')
  final bool isActive;

  JobPost({
    required this.id,
    required this.companyId,
    required this.workTypeId,
    required this.companyNameHidden,
    required this.createdDate,
    required this.jobDescription,
    required this.jobLocation,
    required this.isActive,
  });
}
