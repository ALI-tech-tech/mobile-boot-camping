// ignore_for_file: public_member_api_docs, sort_constructors_first
class Awards {
  int? id;
  int? actor_id;
  String? name;

  Awards({
    this.id,
    this.name,
  });

  Awards.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    actor_id=json['actor_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id']=this.id;
    data['actor_id']=this.actor_id;
    return data;
  }
}
