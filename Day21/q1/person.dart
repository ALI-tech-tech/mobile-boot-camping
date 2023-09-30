import 'user.dart';

class Person implements User{
  @override
  String? name;

  @override
  String? phone;

  @override
  update(String msg) {
    print("[${DateTime.now()}] Hey ${name},${msg}");
  }

  Person({required this.name,required this.phone});
  
}