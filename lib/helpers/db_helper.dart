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
      '''INSERT INTO user_type (name) VALUES ("Admin"),("Company"),("Employee");''';
  static String worktype = '''INSERT INTO work_type (name) VALUES
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
  ('E-commerce'),
  ('Information Security'),
  ('Data Privacy'),
  ('Digital Marketing'),
  ('Brand Management'),
  ('Corporate Strategy'),
  ('Financial Analysis'),
  ('Talent Acquisition'),
  ('Employee Training'),
  ('Sales Operations'),
  ('Business Analytics'),
  ('Customer Relationship Management'),
  ('Market Analysis'),
  ('Operations Management'),
  ('Product Development'),
  ('Supply Chain Optimization'),
  ('Quality Control'),
  ('Compliance'),
  ('Intellectual Property'),
  ('IT Infrastructure'),
  ('Software Implementation'),
  ('IT Service Management'),
  ('Business Process Optimization'),
  ('Change Management'),
  ('Risk Assessment'),
  ('Sustainability'),
  ('Social Media Management'),
  ('Content Creation'),
  ('Event Planning and Coordination'),
  ('Market Expansion'),
  ('Financial Planning and Forecasting');''';
}
