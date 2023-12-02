import 'package:floor/floor.dart';


import '../entities/company.dart';

@dao
abstract class CompanyDao {
  @Query('SELECT * FROM company')
  Future<List<Company>> getAllCompanies();

  @Query('SELECT * FROM company WHERE id = :id')
  Future<Company?> getCompanyById(int id);
@Query('SELECT * FROM company join user on company.user_id=user.id WHERE user_id =:id')
  Future<Company?> getCompanyByUserId(int id);

  @insert
  Future<void> insertCompany(Company company);

  @update
  Future<void> updateCompany(Company company);

  @delete
  Future<void> deleteCompany(Company company);
}