import 'package:floor/floor.dart';


import '../entities/company.dart';

@dao
abstract class CompanyDao {
  @Query('SELECT * FROM company')
  Future<List<Company>> getAllCompanies();

  @Query('SELECT * FROM company WHERE id = :id')
  Future<Company?> getCompanyById(int id);

  @insert
  Future<void> insertCompany(Company company);

  @update
  Future<void> updateCompany(Company company);

  @delete
  Future<void> deleteCompany(Company company);
}