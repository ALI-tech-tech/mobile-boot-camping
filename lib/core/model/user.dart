// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int? id;
  String? name;
  String? email;
  String? token;
  int? password;

  User({
    this.id,
    this.name,
    this.email,
    this.token,
    this.password
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password=json['password']??"";
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    data['password']=this.password;
    return data;
  }
}
