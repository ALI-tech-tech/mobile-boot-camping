
import 'package:floor/floor.dart';
import 'package:jobsfinder/core/localdatabase/entities/company.dart';

import 'work_type.dart';

@Entity(tableName: 'job_post')
class JobPost {
  @PrimaryKey()
  final int id;

  @ForeignKey(entity: Company, childColumns: ['company_id'], parentColumns: ['id'])

  @ColumnInfo(name: 'company_id')
  final int companyId;
  @ForeignKey(entity: WorkType, childColumns: ['work_type_id'], parentColumns: ['id'])

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
