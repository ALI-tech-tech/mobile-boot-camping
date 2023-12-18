// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Note extends ChangeNotifier {
  String? id;
  String title;
  String description;
  String status;
  String get getTitle => this.title;

  set setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  get getDescription => this.description;

  set setDescription(description) {
    this.description = description;
    notifyListeners();
  }

  get getStatus => this.status;

  set setStatus(status) => this.status = status;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }

  factory Note.fromMap({required Map<String, dynamic> map, String? docId}) {
    return Note(
      id: docId??"",
      title: map['title'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
    );
  }


}
