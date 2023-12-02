
import 'package:get_storage/get_storage.dart';
import 'package:jobsfinder/core/localdatabase/entities/company.dart';
import 'package:jobsfinder/core/localdatabase/entities/seeker.dart';
import 'package:jobsfinder/core/localdatabase/entities/user.dart';
import 'package:jobsfinder/helpers/db_helper.dart';

import '../../core/localdatabase/entities/user_type.dart';

class UserViewModel {
  List<UserType> usertype = [];
  List<User> allUsers = [];
  static List userInfo=[];
  GetStorage box=GetStorage();
  String? imgProfileByte;

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

  void storeUser(User user)async {
  await readRoles();
  box.write('username', user.userName);
  box.write('fname', user.firstName);
  box.write('lname', user.lastName);
  box.write('userid', user.id);
  box.write('usertype', usertype.where((element) => element.id==user.userTypeId).first.name);
  box.write('isactive', user.isActive);
  box.write('is_logged_in', true);
}
  void removeUser()async {
  
  await box.erase();
 
}
  // getUserinfo(User user)async{
  //   await readRoles();
    
  //   if (user.userTypeId==getRole(user, "Company")) {
  //     userInfo= [ DBHelper.database.companydao.getCompanyByUserId(user.id!),1];
  //   }else if(user.userTypeId==getRole(user, "Employee")){
  //     userInfo= [DBHelper.database.seekerdao.getSeekerByUserId(user.id!),2];
  //   }else if(user.userTypeId==getRole(user, "Admin")){
  //     userInfo= [User,3];
  //   }

  // }

  getimgeprofile()async{
    
    if (box.read("usertype")=='Company') {
      Company? co=await DBHelper.database.companydao.getCompanyByUserId(box.read("userid"));
      box.write('profile', co!.image);
    }else if (box.read("usertype")=='Employee') {
      print(box.read("userid").runtimeType);
      print(box.read("userid"));
      Seeker? sk=await DBHelper.database.seekerdao.getSeekerByUserId(box.read("userid"));
      box.write('profile', sk!.image);
   
      // imgProfileByte= sk.image;
    } 

  }
  getRole(User user, String role){
    return usertype.where((element) => element.name==role).first.id;
  }
}
