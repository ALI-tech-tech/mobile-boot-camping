import 'package:floor/floor.dart';

import '../core/localdatabase/database/app_database.dart';

class DBHelper {
  static late AppDatabase database;

  static initDatabase() async {
    Callback callback = Callback(onCreate: (db, _) {
      db.execute(Data.UserType);
      db.execute(Data.worktype);
    });
    database = await $FloorAppDatabase
        .databaseBuilder('jobsfinder.db')
        .addCallback(callback)
        .build();
  }
}

class Data {
  static String UserType =
      '''INSERT INTO user_type (name) VALUES (Admin),(Company),(Employee)''';
  static String worktype = '''INSERT INTO work_type (name) VALUES
  ('Software Engineering'),
  ('Data Science'),
  ('Web Development'),
  ('Network Administration'),
  ('Cybersecurity'),
  ('Database Management'),
  ('Artificial Intelligence'),
  ('Cloud Computing'),
  ('Machine Learning'),
  ('Information Systems'),
  ('Computer Graphics'),
  ('Mobile App Development'),
  ('IT Project Management'),
  ('Computer Networking'),
  ('Software Testing'),
  ('Computer Hardware Engineering'),
  ('IT Consulting'),
  ('Systems Analysis'),
  ('User Interface Design'),
  ('Computer Vision'),
  ('Computer Architecture'),
  ('IT Support'),
  ('Big Data Analytics'),
  ('Operating Systems'),
  ('Computer Programming'),
  ('IT Governance'),
  ('Network Security'),
  ('IT Risk Management'),
  ('Blockchain Technology'),
  ('Internet of Things (IoT)'),
  ('Computer Ethics'),
  ('Marketing'),
  ('Finance'),
  ('Human Resources'),
  ('Sales'),
  ('Operations'),
  ('Business Development'),
  ('Project Management'),
  ('Product Management'),
  ('Customer Service'),
  ('Supply Chain Management'),
  ('Quality Assurance'),
  ('Risk Management'),
  ('Strategic Planning'),
  ('Market Research'),
  ('Data Analysis'),
  ('Public Relations'),
  ('Corporate Communications'),
  ('Legal Services'),
  ('Information Technology'),
  ('Research and Development'),
  ('Consulting'),
  ('Procurement'),
  ('Logistics'),
  ('Event Management'),
  ('Training and Development'),
  ('Accounting'),
  ('Business Analytics'),
  ('Internal Audit'),
  ('Corporate Social Responsibility'),
  ('Business Intelligence'),
  ('E-commerce');''';
}
