import 'user.dart';

class Obs {
  List<User> ls=[];

  add(User user){
    ls.add(user);
  }

  remove(User usr){
    ls.remove(usr);
  }

  notify(String msg){
    ls.forEach((element) {
      element.update(msg);
    });
  }
}