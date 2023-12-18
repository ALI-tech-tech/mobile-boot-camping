import 'dart:math';

import 'package:flutter/foundation.dart';

import '../model/note.dart';

class NoteViewmodel extends ChangeNotifier {
  List<Note> allNotes = [];
  
  String value = Status.NotStarted.value;
  addNote(Note note) {
    note.id = genratingID();
    allNotes.add(note);
    notifyListeners();
  }

  Updatevalue(String status) {
    value = status;
    notifyListeners();
  }

  updateNoteStatus(String notid, String? status) {
    allNotes.forEach((element) {
      if (element.id == notid) {
        element.status = status!;
        notifyListeners();
      }
    });
  }

  delete(String id) {
    Note note= allNotes.firstWhere((element) => element.id==id);
    allNotes.remove(note);
    notifyListeners();
  }

  genratingID() {
    int id = Random().nextInt(10000);
    allNotes.forEach((element) {
      if (element.id == id) {
        genratingID();
      }
    });
    return id.toString();
  }

  updatenote(Note note) {
    print(note.id);
    allNotes.forEach((element) {
      if (element.id == note.id) {
        element.setTitle = note.title;
        element.setDescription=note.description;
      print("55555555555555555555555555555");
        notifyListeners();
      }
    });
    //notifyListeners();
  }
}

enum Status {
  NotStarted("Not Started"),
  InProgress("In Progress"),
  Done("Done");

  const Status(this.value);
  final String value;
}
