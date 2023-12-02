// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CompanyDao? _companydaoInstance;

  EducationDao? _educatiodaoInstance;

  ExperienceDao? _experiencedaoInstance;

  JobPostDao? _jobpostdaoInstance;

  SeekerDao? _seekerdaoInstance;

  SkillDao? _skilldaoInstance;

  UserDao? _userdaoInstance;

  UserTypeDao? _usertypedaoInstance;

  UserWorkTypeDao? _userworktypedaoInstance;

  WorkTypeDao? _worktypedaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `company` (`id` INTEGER, `user_id` INTEGER, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `work_type_id` INTEGER NOT NULL, `establish_date` TEXT NOT NULL, `website` TEXT NOT NULL, `image` TEXT, `id_card` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `education` (`id` INTEGER, `seeker_id` INTEGER NOT NULL, `degree_name` TEXT NOT NULL, `major` TEXT NOT NULL, `insta_univer_name` TEXT NOT NULL, `started_date` TEXT NOT NULL, `completion_date` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `experience` (`id` INTEGER NOT NULL, `seeker_id` INTEGER NOT NULL, `is_current_job` INTEGER NOT NULL, `started_date` TEXT NOT NULL, `end_date` TEXT NOT NULL, `job_title` TEXT NOT NULL, `company_name` TEXT NOT NULL, `description` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `job_post` (`id` INTEGER NOT NULL, `company_id` INTEGER NOT NULL, `work_type_id` INTEGER NOT NULL, `companyName_hidden` TEXT NOT NULL, `created_date` TEXT NOT NULL, `job_desc` TEXT NOT NULL, `job_location` TEXT NOT NULL, `is_active` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `seeker` (`id` INTEGER, `user_id` INTEGER NOT NULL, `image` TEXT, `descrip` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `skill` (`id` INTEGER NOT NULL, `user_id` INTEGER NOT NULL, `skill_name` TEXT NOT NULL, `level` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user_type` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user_work_type` (`user_id` INTEGER NOT NULL, `work_type_id` INTEGER NOT NULL, FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`work_type_id`) REFERENCES `work_type` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`user_id`, `work_type_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER, `first_name` TEXT, `last_name` TEXT, `user_name` TEXT, `password` TEXT, `email` TEXT, `is_active` INTEGER, `user_type_id` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `work_type` (`id` INTEGER, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CompanyDao get companydao {
    return _companydaoInstance ??= _$CompanyDao(database, changeListener);
  }

  @override
  EducationDao get educatiodao {
    return _educatiodaoInstance ??= _$EducationDao(database, changeListener);
  }

  @override
  ExperienceDao get experiencedao {
    return _experiencedaoInstance ??= _$ExperienceDao(database, changeListener);
  }

  @override
  JobPostDao get jobpostdao {
    return _jobpostdaoInstance ??= _$JobPostDao(database, changeListener);
  }

  @override
  SeekerDao get seekerdao {
    return _seekerdaoInstance ??= _$SeekerDao(database, changeListener);
  }

  @override
  SkillDao get skilldao {
    return _skilldaoInstance ??= _$SkillDao(database, changeListener);
  }

  @override
  UserDao get userdao {
    return _userdaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  UserTypeDao get usertypedao {
    return _usertypedaoInstance ??= _$UserTypeDao(database, changeListener);
  }

  @override
  UserWorkTypeDao get userworktypedao {
    return _userworktypedaoInstance ??=
        _$UserWorkTypeDao(database, changeListener);
  }

  @override
  WorkTypeDao get worktypedao {
    return _worktypedaoInstance ??= _$WorkTypeDao(database, changeListener);
  }
}

class _$CompanyDao extends CompanyDao {
  _$CompanyDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _companyInsertionAdapter = InsertionAdapter(
            database,
            'company',
            (Company item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.Userid,
                  'name': item.name,
                  'description': item.description,
                  'work_type_id': item.workTypeId,
                  'establish_date': item.establishDate,
                  'website': item.website,
                  'image': item.image,
                  'id_card': item.idCard
                }),
        _companyUpdateAdapter = UpdateAdapter(
            database,
            'company',
            ['id'],
            (Company item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.Userid,
                  'name': item.name,
                  'description': item.description,
                  'work_type_id': item.workTypeId,
                  'establish_date': item.establishDate,
                  'website': item.website,
                  'image': item.image,
                  'id_card': item.idCard
                }),
        _companyDeletionAdapter = DeletionAdapter(
            database,
            'company',
            ['id'],
            (Company item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.Userid,
                  'name': item.name,
                  'description': item.description,
                  'work_type_id': item.workTypeId,
                  'establish_date': item.establishDate,
                  'website': item.website,
                  'image': item.image,
                  'id_card': item.idCard
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Company> _companyInsertionAdapter;

  final UpdateAdapter<Company> _companyUpdateAdapter;

  final DeletionAdapter<Company> _companyDeletionAdapter;

  @override
  Future<List<Company>> getAllCompanies() async {
    return _queryAdapter.queryList('SELECT * FROM company',
        mapper: (Map<String, Object?> row) => Company(
            id: row['id'] as int?,
            Userid: row['user_id'] as int?,
            name: row['name'] as String,
            description: row['description'] as String,
            workTypeId: row['work_type_id'] as int,
            establishDate: row['establish_date'] as String,
            website: row['website'] as String,
            image: row['image'] as String?,
            idCard: row['id_card'] as String?));
  }

  @override
  Future<Company?> getCompanyById(int id) async {
    return _queryAdapter.query('SELECT * FROM company WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Company(
            id: row['id'] as int?,
            Userid: row['user_id'] as int?,
            name: row['name'] as String,
            description: row['description'] as String,
            workTypeId: row['work_type_id'] as int,
            establishDate: row['establish_date'] as String,
            website: row['website'] as String,
            image: row['image'] as String?,
            idCard: row['id_card'] as String?),
        arguments: [id]);
  }

  @override
  Future<Company?> getCompanyByUserId(int id) async {
    return _queryAdapter.query(
        'SELECT * FROM company join user on company.user_id=user.id WHERE user_id =?1',
        mapper: (Map<String, Object?> row) => Company(
          id: row['id'] as int?, 
          Userid: row['user_id'] as int?, 
          name: row['name'] as String,
           description: row['description'] as String, 
           workTypeId: row['work_type_id'] as int,
            establishDate: row['establish_date'] as String,
             website: row['website'] as String,
              image: row['image'] as String?, 
              idCard: row['id_card'] as String?,
          
             
  
              ),
        arguments: [id]);
  }

  @override
  Future<void> insertCompany(Company company) async {
    await _companyInsertionAdapter.insert(company, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCompany(Company company) async {
    await _companyUpdateAdapter.update(company, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCompany(Company company) async {
    await _companyDeletionAdapter.delete(company);
  }
}

class _$EducationDao extends EducationDao {
  _$EducationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _educationInsertionAdapter = InsertionAdapter(
            database,
            'education',
            (Education item) => <String, Object?>{
                  'id': item.id,
                  'seeker_id': item.seekerId,
                  'degree_name': item.degreeName,
                  'major': item.major,
                  'insta_univer_name': item.instituteUniversityName,
                  'started_date': item.startDate,
                  'completion_date': item.completionDate
                }),
        _educationUpdateAdapter = UpdateAdapter(
            database,
            'education',
            ['id'],
            (Education item) => <String, Object?>{
                  'id': item.id,
                  'seeker_id': item.seekerId,
                  'degree_name': item.degreeName,
                  'major': item.major,
                  'insta_univer_name': item.instituteUniversityName,
                  'started_date': item.startDate,
                  'completion_date': item.completionDate
                }),
        _educationDeletionAdapter = DeletionAdapter(
            database,
            'education',
            ['id'],
            (Education item) => <String, Object?>{
                  'id': item.id,
                  'seeker_id': item.seekerId,
                  'degree_name': item.degreeName,
                  'major': item.major,
                  'insta_univer_name': item.instituteUniversityName,
                  'started_date': item.startDate,
                  'completion_date': item.completionDate
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Education> _educationInsertionAdapter;

  final UpdateAdapter<Education> _educationUpdateAdapter;

  final DeletionAdapter<Education> _educationDeletionAdapter;

  @override
  Future<List<Education>> getAllEducations() async {
    return _queryAdapter.queryList('SELECT * FROM education',
        mapper: (Map<String, Object?> row) => Education(
            id: row['id'] as int?,
            seekerId: row['seeker_id'] as int,
            degreeName: row['degree_name'] as String,
            major: row['major'] as String,
            instituteUniversityName: row['insta_univer_name'] as String,
            startDate: row['started_date'] as String,
            completionDate: row['completion_date'] as String));
  }

  @override
  Future<Education?> getEducationById(int id) async {
    return _queryAdapter.query('SELECT * FROM education WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Education(
            id: row['id'] as int?,
            seekerId: row['seeker_id'] as int,
            degreeName: row['degree_name'] as String,
            major: row['major'] as String,
            instituteUniversityName: row['insta_univer_name'] as String,
            startDate: row['started_date'] as String,
            completionDate: row['completion_date'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertEducation(Education education) async {
    await _educationInsertionAdapter.insert(
        education, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateEducation(Education education) async {
    await _educationUpdateAdapter.update(education, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteEducation(Education education) async {
    await _educationDeletionAdapter.delete(education);
  }
}

class _$ExperienceDao extends ExperienceDao {
  _$ExperienceDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _experienceInsertionAdapter = InsertionAdapter(
            database,
            'experience',
            (Experience item) => <String, Object?>{
                  'id': item.id,
                  'seeker_id': item.seekerId,
                  'is_current_job': item.isCurrentJob ? 1 : 0,
                  'started_date': item.startDate,
                  'end_date': item.endDate,
                  'job_title': item.jobTitle,
                  'company_name': item.companyName,
                  'description': item.description
                }),
        _experienceUpdateAdapter = UpdateAdapter(
            database,
            'experience',
            ['id'],
            (Experience item) => <String, Object?>{
                  'id': item.id,
                  'seeker_id': item.seekerId,
                  'is_current_job': item.isCurrentJob ? 1 : 0,
                  'started_date': item.startDate,
                  'end_date': item.endDate,
                  'job_title': item.jobTitle,
                  'company_name': item.companyName,
                  'description': item.description
                }),
        _experienceDeletionAdapter = DeletionAdapter(
            database,
            'experience',
            ['id'],
            (Experience item) => <String, Object?>{
                  'id': item.id,
                  'seeker_id': item.seekerId,
                  'is_current_job': item.isCurrentJob ? 1 : 0,
                  'started_date': item.startDate,
                  'end_date': item.endDate,
                  'job_title': item.jobTitle,
                  'company_name': item.companyName,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Experience> _experienceInsertionAdapter;

  final UpdateAdapter<Experience> _experienceUpdateAdapter;

  final DeletionAdapter<Experience> _experienceDeletionAdapter;

  @override
  Future<List<Experience>> getAllExperiences() async {
    return _queryAdapter.queryList('SELECT * FROM experience',
        mapper: (Map<String, Object?> row) => Experience(
            id: row['id'] as int,
            seekerId: row['seeker_id'] as int,
            isCurrentJob: (row['is_current_job'] as int) != 0,
            startDate: row['started_date'] as String,
            endDate: row['end_date'] as String,
            jobTitle: row['job_title'] as String,
            companyName: row['company_name'] as String,
            description: row['description'] as String));
  }

  @override
  Future<Experience?> getExperienceById(int id) async {
    return _queryAdapter.query('SELECT * FROM experience WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Experience(
            id: row['id'] as int,
            seekerId: row['seeker_id'] as int,
            isCurrentJob: (row['is_current_job'] as int) != 0,
            startDate: row['started_date'] as String,
            endDate: row['end_date'] as String,
            jobTitle: row['job_title'] as String,
            companyName: row['company_name'] as String,
            description: row['description'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertExperience(Experience experience) async {
    await _experienceInsertionAdapter.insert(
        experience, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateExperience(Experience experience) async {
    await _experienceUpdateAdapter.update(experience, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteExperience(Experience experience) async {
    await _experienceDeletionAdapter.delete(experience);
  }
}

class _$JobPostDao extends JobPostDao {
  _$JobPostDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _jobPostInsertionAdapter = InsertionAdapter(
            database,
            'job_post',
            (JobPost item) => <String, Object?>{
                  'id': item.id,
                  'company_id': item.companyId,
                  'work_type_id': item.workTypeId,
                  'companyName_hidden': item.companyNameHidden,
                  'created_date': item.createdDate,
                  'job_desc': item.jobDescription,
                  'job_location': item.jobLocation,
                  'is_active': item.isActive ? 1 : 0
                }),
        _jobPostUpdateAdapter = UpdateAdapter(
            database,
            'job_post',
            ['id'],
            (JobPost item) => <String, Object?>{
                  'id': item.id,
                  'company_id': item.companyId,
                  'work_type_id': item.workTypeId,
                  'companyName_hidden': item.companyNameHidden,
                  'created_date': item.createdDate,
                  'job_desc': item.jobDescription,
                  'job_location': item.jobLocation,
                  'is_active': item.isActive ? 1 : 0
                }),
        _jobPostDeletionAdapter = DeletionAdapter(
            database,
            'job_post',
            ['id'],
            (JobPost item) => <String, Object?>{
                  'id': item.id,
                  'company_id': item.companyId,
                  'work_type_id': item.workTypeId,
                  'companyName_hidden': item.companyNameHidden,
                  'created_date': item.createdDate,
                  'job_desc': item.jobDescription,
                  'job_location': item.jobLocation,
                  'is_active': item.isActive ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<JobPost> _jobPostInsertionAdapter;

  final UpdateAdapter<JobPost> _jobPostUpdateAdapter;

  final DeletionAdapter<JobPost> _jobPostDeletionAdapter;

  @override
  Future<List<JobPost>> getAllJobPosts() async {
    return _queryAdapter.queryList('SELECT * FROM job_post',
        mapper: (Map<String, Object?> row) => JobPost(
            id: row['id'] as int,
            companyId: row['company_id'] as int,
            workTypeId: row['work_type_id'] as int,
            companyNameHidden: row['companyName_hidden'] as String,
            createdDate: row['created_date'] as String,
            jobDescription: row['job_desc'] as String,
            jobLocation: row['job_location'] as String,
            isActive: (row['is_active'] as int) != 0));
  }

  @override
  Future<JobPost?> getJobPostById(int id) async {
    return _queryAdapter.query('SELECT * FROM job_post WHERE id = ?1',
        mapper: (Map<String, Object?> row) => JobPost(
            id: row['id'] as int,
            companyId: row['company_id'] as int,
            workTypeId: row['work_type_id'] as int,
            companyNameHidden: row['companyName_hidden'] as String,
            createdDate: row['created_date'] as String,
            jobDescription: row['job_desc'] as String,
            jobLocation: row['job_location'] as String,
            isActive: (row['is_active'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insertJobPost(JobPost jobPost) async {
    await _jobPostInsertionAdapter.insert(jobPost, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateJobPost(JobPost jobPost) async {
    await _jobPostUpdateAdapter.update(jobPost, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteJobPost(JobPost jobPost) async {
    await _jobPostDeletionAdapter.delete(jobPost);
  }
}

class _$SeekerDao extends SeekerDao {
  _$SeekerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _seekerInsertionAdapter = InsertionAdapter(
            database,
            'seeker',
            (Seeker item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'image': item.image,
                  'descrip': item.descrip
                }),
        _seekerUpdateAdapter = UpdateAdapter(
            database,
            'seeker',
            ['id'],
            (Seeker item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'image': item.image,
                  'descrip': item.descrip
                }),
        _seekerDeletionAdapter = DeletionAdapter(
            database,
            'seeker',
            ['id'],
            (Seeker item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'image': item.image,
                  'descrip': item.descrip
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Seeker> _seekerInsertionAdapter;

  final UpdateAdapter<Seeker> _seekerUpdateAdapter;

  final DeletionAdapter<Seeker> _seekerDeletionAdapter;

  @override
  Future<List<Seeker>> getAllSeekers() async {
    return _queryAdapter.queryList('SELECT * FROM seeker',
        mapper: (Map<String, Object?> row) => Seeker(
            id: row['id'] as int?,
            userId: row['user_id'] as int,
            image: row['image'] as String?,
            descrip: row['descrip'] as String));
  }

  @override
  Future<Seeker?> getSeekerById(int id) async {
    return _queryAdapter.query('SELECT * FROM seeker WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Seeker(
            id: row['id'] as int?,
            userId: row['user_id'] as int,
            image: row['image'] as String?,
            descrip: row['descrip'] as String),
        arguments: [id]);
  }

  @override
  Future<Seeker?> getSeekerByUserId(int id) async {
    return _queryAdapter.query('SELECT * FROM seeker WHERE user_id = ?1',
        mapper: (Map<String, Object?> row) => Seeker(
            id: row['id'] as int?,
            userId: row['user_id'] as int,
            image: row['image'] as String?,
            descrip: row['descrip'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertSeeker(Seeker seeker) {
    return _seekerInsertionAdapter.insertAndReturnId(
        seeker, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSeeker(Seeker seeker) async {
    await _seekerUpdateAdapter.update(seeker, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSeeker(Seeker seeker) async {
    await _seekerDeletionAdapter.delete(seeker);
  }
}

class _$SkillDao extends SkillDao {
  _$SkillDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _skillInsertionAdapter = InsertionAdapter(
            database,
            'skill',
            (Skill item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'skill_name': item.skillName,
                  'level': item.level
                }),
        _skillUpdateAdapter = UpdateAdapter(
            database,
            'skill',
            ['id'],
            (Skill item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'skill_name': item.skillName,
                  'level': item.level
                }),
        _skillDeletionAdapter = DeletionAdapter(
            database,
            'skill',
            ['id'],
            (Skill item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'skill_name': item.skillName,
                  'level': item.level
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Skill> _skillInsertionAdapter;

  final UpdateAdapter<Skill> _skillUpdateAdapter;

  final DeletionAdapter<Skill> _skillDeletionAdapter;

  @override
  Future<List<Skill>> getAllSkills() async {
    return _queryAdapter.queryList('SELECT * FROM skill',
        mapper: (Map<String, Object?> row) => Skill(
            id: row['id'] as int,
            userId: row['user_id'] as int,
            skillName: row['skill_name'] as String,
            level: row['level'] as int));
  }

  @override
  Future<Skill?> getSkillById(int id) async {
    return _queryAdapter.query('SELECT * FROM skill WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Skill(
            id: row['id'] as int,
            userId: row['user_id'] as int,
            skillName: row['skill_name'] as String,
            level: row['level'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertSkill(Skill skill) async {
    await _skillInsertionAdapter.insert(skill, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSkill(Skill skill) async {
    await _skillUpdateAdapter.update(skill, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSkill(Skill skill) async {
    await _skillDeletionAdapter.delete(skill);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'first_name': item.firstName,
                  'last_name': item.lastName,
                  'user_name': item.userName,
                  'password': item.password,
                  'email': item.email,
                  'is_active':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'user_type_id': item.userTypeId
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'user',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'first_name': item.firstName,
                  'last_name': item.lastName,
                  'user_name': item.userName,
                  'password': item.password,
                  'email': item.email,
                  'is_active':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'user_type_id': item.userTypeId
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'user',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'first_name': item.firstName,
                  'last_name': item.lastName,
                  'user_name': item.userName,
                  'password': item.password,
                  'email': item.email,
                  'is_active':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'user_type_id': item.userTypeId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> getAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM user',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            firstName: row['first_name'] as String?,
            lastName: row['last_name'] as String?,
            email: row['email'] as String?,
            userName: row['user_name'] as String?,
            password: row['password'] as String?,
            isActive: row['is_active'] == null
                ? null
                : (row['is_active'] as int) != 0,
            userTypeId: row['user_type_id'] as int?));
  }

  @override
  Future<User?> getUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM user WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            firstName: row['first_name'] as String?,
            lastName: row['last_name'] as String?,
            email: row['email'] as String?,
            userName: row['user_name'] as String?,
            password: row['password'] as String?,
            isActive: row['is_active'] == null
                ? null
                : (row['is_active'] as int) != 0,
            userTypeId: row['user_type_id'] as int?),
        arguments: [id]);
  }

  @override
  Future<int> insertUser(User user) {
    return _userInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateUser(User user) {
    return _userUpdateAdapter.updateAndReturnChangedRows(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUser(User user) {
    return _userDeletionAdapter.deleteAndReturnChangedRows(user);
  }
}

class _$UserTypeDao extends UserTypeDao {
  _$UserTypeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userTypeInsertionAdapter = InsertionAdapter(
            database,
            'user_type',
            (UserType item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _userTypeUpdateAdapter = UpdateAdapter(
            database,
            'user_type',
            ['id'],
            (UserType item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _userTypeDeletionAdapter = DeletionAdapter(
            database,
            'user_type',
            ['id'],
            (UserType item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserType> _userTypeInsertionAdapter;

  final UpdateAdapter<UserType> _userTypeUpdateAdapter;

  final DeletionAdapter<UserType> _userTypeDeletionAdapter;

  @override
  Future<List<UserType>> getAllUserTypes() async {
    return _queryAdapter.queryList('SELECT * FROM user_type',
        mapper: (Map<String, Object?> row) =>
            UserType(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<UserType?> getUserTypeById(int id) async {
    return _queryAdapter.query('SELECT * FROM user_type WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            UserType(id: row['id'] as int, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertUserType(UserType userType) async {
    await _userTypeInsertionAdapter.insert(userType, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUserType(UserType userType) async {
    await _userTypeUpdateAdapter.update(userType, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUserType(UserType userType) async {
    await _userTypeDeletionAdapter.delete(userType);
  }
}

class _$UserWorkTypeDao extends UserWorkTypeDao {
  _$UserWorkTypeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userWorkTypeInsertionAdapter = InsertionAdapter(
            database,
            'user_work_type',
            (UserWorkType item) => <String, Object?>{
                  'user_id': item.userId,
                  'work_type_id': item.workTypeId
                }),
        _userWorkTypeDeletionAdapter = DeletionAdapter(
            database,
            'user_work_type',
            ['user_id', 'work_type_id'],
            (UserWorkType item) => <String, Object?>{
                  'user_id': item.userId,
                  'work_type_id': item.workTypeId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserWorkType> _userWorkTypeInsertionAdapter;

  final DeletionAdapter<UserWorkType> _userWorkTypeDeletionAdapter;

  @override
  Future<List<UserWorkType>> getAllUserWorkTypes() async {
    return _queryAdapter.queryList('SELECT * FROM user_work_type',
        mapper: (Map<String, Object?> row) => UserWorkType(
            userId: row['user_id'] as int,
            workTypeId: row['work_type_id'] as int));
  }

  @override
  Future<List<UserWorkType>> getUserWorkTypesByUserId(int userId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM user_work_type WHERE user_id = ?1',
        mapper: (Map<String, Object?> row) => UserWorkType(
            userId: row['user_id'] as int,
            workTypeId: row['work_type_id'] as int),
        arguments: [userId]);
  }

  @override
  Future<List<UserWorkType>> getUserWorkTypesByWorkTypeId(
      int workTypeId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM user_work_type WHERE work_type_id = ?1',
        mapper: (Map<String, Object?> row) => UserWorkType(
            userId: row['user_id'] as int,
            workTypeId: row['work_type_id'] as int),
        arguments: [workTypeId]);
  }

  @override
  Future<UserWorkType?> getUserWorkTypeByUserIdAndWorkTypeId(
    int userId,
    int workTypeId,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM user_work_type WHERE user_id = ?1 AND work_type_id = ?2',
        mapper: (Map<String, Object?> row) => UserWorkType(
            userId: row['user_id'] as int,
            workTypeId: row['work_type_id'] as int),
        arguments: [userId, workTypeId]);
  }

  @override
  Future<void> insertUserWorkType(UserWorkType userWorkType) async {
    await _userWorkTypeInsertionAdapter.insert(
        userWorkType, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUserWorkType(UserWorkType userWorkType) async {
    await _userWorkTypeDeletionAdapter.delete(userWorkType);
  }
}

class _$WorkTypeDao extends WorkTypeDao {
  _$WorkTypeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _workTypeInsertionAdapter = InsertionAdapter(
            database,
            'work_type',
            (WorkType item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _workTypeUpdateAdapter = UpdateAdapter(
            database,
            'work_type',
            ['id'],
            (WorkType item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _workTypeDeletionAdapter = DeletionAdapter(
            database,
            'work_type',
            ['id'],
            (WorkType item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WorkType> _workTypeInsertionAdapter;

  final UpdateAdapter<WorkType> _workTypeUpdateAdapter;

  final DeletionAdapter<WorkType> _workTypeDeletionAdapter;

  @override
  Future<List<WorkType>> getAllWorkTypes() async {
    return _queryAdapter.queryList('SELECT * FROM work_type',
        mapper: (Map<String, Object?> row) =>
            WorkType(id: row['id'] as int?, name: row['name'] as String));
  }

  @override
  Future<WorkType?> getWorkTypeById(int id) async {
    return _queryAdapter.query('SELECT * FROM work_type WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            WorkType(id: row['id'] as int?, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertWorkType(WorkType workType) async {
    await _workTypeInsertionAdapter.insert(workType, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateWorkType(WorkType workType) async {
    await _workTypeUpdateAdapter.update(workType, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteWorkType(WorkType workType) async {
    await _workTypeDeletionAdapter.delete(workType);
  }
}
