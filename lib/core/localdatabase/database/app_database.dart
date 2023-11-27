import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../DAOs/companydao.dart';
import '../DAOs/educationdao.dart';
import '../DAOs/experiencedao.dart';
import '../entities/company.dart';
import '../entities/education.dart';
import '../entities/experians.dart';
import '../entities/job_post.dart';
import '../entities/seeker.dart';
import '../entities/skill.dart';
import '../entities/user.dart';
import '../entities/user_type.dart';
import '../entities/user_work_type.dart';
import '../entities/work_type.dart';


part 'app_database.g.dart';

@Database(version: 1, entities: [Company,Education,Experience,JobPost,Seeker,Skill,UserType,UserWorkType,User,WorkType ])
abstract class AppDatabase extends FloorDatabase {
  CompanyDao get companydao;
  EducationDao get educatiodao;
  ExperienceDao get experiencedao;
}