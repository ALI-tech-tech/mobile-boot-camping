class Post {
  String? title;
  String? body;
  int? id;

  Post({this.title, this.body, this.id});

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['id'] = this.id;
    return data;
  }
}