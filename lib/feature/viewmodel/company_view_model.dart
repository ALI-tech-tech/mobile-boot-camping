import 'package:jobsfinder/core/localdatabase/entities/user.dart';
import 'package:jobsfinder/helpers/db_helper.dart';

import '../../core/localdatabase/entities/company.dart';
import '../../core/localdatabase/entities/user_type.dart';

class CompanyViewModel {
  List<UserType> usertype=[];
  List<Company> allCompanies=[];

  createNewCompany(Company company)async{
    
  }

 readRoles()async{
    usertype= await DBHelper.database.usertypedao.getAllUserTypes();
  }

  readAllCompanies()async{
    allCompanies=await DBHelper.database.companydao.getAllCompanies();
  }
}