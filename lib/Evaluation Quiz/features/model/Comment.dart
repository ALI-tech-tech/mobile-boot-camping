class Comment {
  String? createdAt;
  String? content;
  bool? isActive;
  String? id;
  String? blogId;

  Comment({this.createdAt, this.content, this.isActive, this.id, this.blogId});

  Comment.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    content = json['content'];
    isActive = json['isActive'];
    id = json['id'];
    blogId = json['blogId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['content'] = this.content;
    data['isActive'] = this.isActive;
    data['id'] = this.id;
    data['blogId'] = this.blogId;
    return data;
  }
}