import 'package:jobsfinder/core/localdatabase/entities/user.dart';
import 'package:jobsfinder/helpers/db_helper.dart';

import '../../core/localdatabase/entities/user_type.dart';

class UserViewModel {
  List<UserType> usertype = [];
  List<User> allUsers = [];

  createNewUser(User user) async {
    await readRoles();
    user.setUserTypeId =
        (usertype.firstWhere((element) => element.name == "Employee")).id;
    int? res = await DBHelper.database.userdao.insertUser(user);
    print(res);
    return res;
  }

  readRoles() async {
    usertype = await DBHelper.database.usertypedao.getAllUserTypes();
  }

  readAllUsers() async {
    allUsers = await DBHelper.database.userdao.getAllUsers();
  }

  updateRole(int type, User user) async {
    await readRoles();
    int? id;

    switch (type) {
      case 2:
        id = usertype.firstWhere((element) => element.name == "Company").id;
        break;
      case 1:
        id = usertype.firstWhere((element) => element.name == "Employee").id;
        break;
      default:
      
    }
    user.setUserTypeId = id??3;
    await DBHelper.database.userdao.updateUser(user);
    return user;
  }

  Future<User> readOneUser(String email ,String password)async{
    await readAllUsers();
    User user=allUsers.where((element) => element.email==email && element.password==password).isEmpty
    ?User.empty():allUsers.where((element) => element.email==email && element.password==password).first;
  
    return user;
  }
}
