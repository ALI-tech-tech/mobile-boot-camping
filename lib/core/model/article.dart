

import 'comment.dart';
import 'user.dart';

class Article {
  int? id;
  String? title;
  String? content;
  String? image;
  int? totalViews;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<Comments>? comments;
  User? user;

  Article(
      {this.id,
        this.title,
        this.content,
        this.image,
        this.totalViews,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.comments,
        this.user});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    totalViews = json['total_views'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id??0;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image??'';
    // data['user_id'] = this.userId;
   
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}