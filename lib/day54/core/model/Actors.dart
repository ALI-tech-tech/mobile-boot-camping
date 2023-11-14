// ignore_for_file: public_member_api_docs, sort_constructors_first
class Actors {
  int? id;
  String? name;

  Actors({
    this.id,
    this.name,
  });

  Actors.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
