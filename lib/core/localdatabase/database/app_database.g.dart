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
            'CREATE TABLE IF NOT EXISTS `company` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `work_type_id` INTEGER NOT NULL, `establish_date` TEXT NOT NULL, `website` TEXT NOT NULL, `image` TEXT NOT NULL, `id_card` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `education` (`id` INTEGER NOT NULL, `seeker_id` INTEGER NOT NULL, `degree_name` TEXT NOT NULL, `major` TEXT NOT NULL, `insta_univer_name` TEXT NOT NULL, `started_date` TEXT NOT NULL, `completion_date` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `experience` (`id` INTEGER NOT NULL, `user_id` INTEGER NOT NULL, `seeker_id` INTEGER NOT NULL, `is_current_job` INTEGER NOT NULL, `started_date` TEXT NOT NULL, `end_date` TEXT NOT NULL, `job_title` TEXT NOT NULL, `company_name` TEXT NOT NULL, `description` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `job_post` (`id` INTEGER NOT NULL, `company_id` INTEGER NOT NULL, `work_type_id` INTEGER NOT NULL, `companyName_hidden` TEXT NOT NULL, `created_date` TEXT NOT NULL, `job_desc` TEXT NOT NULL, `job_location` TEXT NOT NULL, `is_active` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `seeker` (`id` INTEGER NOT NULL, `user_id` INTEGER NOT NULL, `image` TEXT NOT NULL, `descrip` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `skill` (`id` INTEGER NOT NULL, `user_id` INTEGER NOT NULL, `skill_name` TEXT NOT NULL, `level` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user_type` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user_work_type` (`user_id` INTEGER NOT NULL, `work_type_id` INTEGER NOT NULL, FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`work_type_id`) REFERENCES `work_type` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`user_id`, `work_type_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER NOT NULL, `first_name` TEXT NOT NULL, `last_name` TEXT NOT NULL, `user_name` TEXT NOT NULL, `password` TEXT NOT NULL, `email` TEXT NOT NULL, `is_active` INTEGER NOT NULL, `user_type_id` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `work_type` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

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
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            workTypeId: row['work_type_id'] as int,
            establishDate: row['establish_date'] as String,
            website: row['website'] as String,
            image: row['image'] as String,
            idCard: row['id_card'] as String));
  }

  @override
  Future<Company?> getCompanyById(int id) async {
    return _queryAdapter.query('SELECT * FROM company WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Company(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            workTypeId: row['work_type_id'] as int,
            establishDate: row['establish_date'] as String,
            website: row['website'] as String,
            image: row['image'] as String,
            idCard: row['id_card'] as String),
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
            id: row['id'] as int,
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
            id: row['id'] as int,
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
                  'user_id': item.userId,
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
                  'user_id': item.userId,
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
                  'user_id': item.userId,
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
            userId: row['user_id'] as int,
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
            userId: row['user_id'] as int,
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
