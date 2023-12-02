import 'package:jobsfinder/helpers/db_helper.dart';

import '../../core/localdatabase/entities/company.dart';
import '../../core/localdatabase/entities/user_type.dart';

class CompanyViewModel {
  List<UserType> usertype=[];
  List<Company> allCompanies=[];
  Company? co;

  createNewCompany(Company company)async{
    
  }

 readRoles()async{
    usertype= await DBHelper.database.usertypedao.getAllUserTypes();
  }

  readAllCompanies()async{
    allCompanies=await DBHelper.database.companydao.getAllCompanies();
  }

  Future<Company?> getCompany(int id)async{
    co=await DBHelper.database.companydao.getCompanyByUserId(id);
    return co;
  }


}