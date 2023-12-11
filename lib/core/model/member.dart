// ignore_for_file: public_member_api_docs, sort_constructors_first
class Member {
  int? id;
  String? name;
  String? special;
  Member({
    
    this.name,
    this.special,
  });

  Map tojson(){
    return {
      'id':this.id,
      'name':this.name,
      'special':this.special
    };
  }

  Member.fromJson(Map<String,dynamic> data){
    this.id=data['id'];
    this.name=data['name'];
    this.special=data['special'];
  }
}
