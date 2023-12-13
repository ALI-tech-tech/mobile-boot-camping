

import 'user.dart';

class Comments {
  int? id;
  int? userId;
  int? articleId;
  String? comment;
  String? createdAt;
  String? updatedAt;
  User? user;

  Comments(
      {this.id,
        this.userId,
        this.articleId,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    articleId = json['article_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['article_id'] = this.articleId;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}