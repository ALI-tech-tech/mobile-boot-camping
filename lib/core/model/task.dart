// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:taskmanager/core/model/member.dart';

// class Task {
//   int? id;
//   String? title;
//   String? body;
//   List<Member>? teem=[]; 
//   String? date;
//   int? timeToDo;
//   int? isDone;
//   Task({
//     this.id,
//     this.title,
//     this.body,
    
//     this.date,
//     this.timeToDo,
//     this.isDone,
//   });
// }
import 'dart:convert';
import 'package:taskmanager/core/model/member.dart';

class Task {
  int? id;
  String? title;
  String? body;
  List<Member>? teem = []; 
  String? date;
  int? timeToDo;
  int? isDone;

  Task({
    this.id,
    this.title,
    this.body,
    this.date,
    this.timeToDo,
    this.isDone,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      body: json['body'],  
      date: json['date'],
      timeToDo: json['timeToDo'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'date': date,
      'timeToDo': timeToDo,
      'isDone': isDone,
    };
  }

  // 
}
