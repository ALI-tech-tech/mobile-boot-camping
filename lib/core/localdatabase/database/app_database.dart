import 'dart:async';

import 'package:floor/floor.dart';
import 'package:jobsfinder/core/localdatabase/DAOs/job_postdao.dart';
import 'package:jobsfinder/core/localdatabase/DAOs/seekerdao.dart';
import 'package:jobsfinder/core/localdatabase/DAOs/skilldao.dart';
import 'package:jobsfinder/core/localdatabase/DAOs/userdao.dart';
import 'package:jobsfinder/core/localdatabase/DAOs/usertypedao.dart';
import 'package:jobsfinder/core/localdatabase/DAOs/userworktypedao.dart';
import 'package:jobsfinder/core/localdatabase/DAOs/worktypedao.dart';
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
  JobPostDao get jobpostdao;
  SeekerDao get seekerdao;
  SkillDao get skilldao;
  UserDao get userdao;
  UserTypeDao get usertypedao;
  UserWorkTypeDao get userworktypedao;
  WorkTypeDao get worktypedao;
}