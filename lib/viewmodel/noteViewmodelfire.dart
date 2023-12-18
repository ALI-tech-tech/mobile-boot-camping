import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/note.dart';
import 'NoteViewModel.dart';

class NotesViewmodelFire extends ChangeNotifier {
  List<Note> allNotes = [];
  String notes = "notes";
  FirebaseFirestore dbobjec = FirebaseFirestore.instance;

  String dropvalue = Status.NotStarted.value;
  String? value;
  NotesViewmodelFire() {
    getallNotes();
  }

  getallNotes() async {
    QuerySnapshot querySnapshot = await dbobjec.collection(notes).get();
    List allData = querySnapshot.docs.map((doc) => doc).toList();
    allNotes = allData
        .map((e) =>
            Note.fromMap(map: e.data() as Map<String, dynamic>, docId: e.id))
        .toList();
    notifyListeners();
    print(allData);
  }

  Updatevalue(String status) {
    this.value = status;
    // print(value);
    notifyListeners();
    print("update to ${this.value}");
    //print(value);
  }
UpdateDropvalue(String status) {
    this.dropvalue = status;
    
    notifyListeners();
    
    //print(value);
  }
  Future<bool> addNote(Note note) async {
    bool isDone = false;
    await dbobjec
        .collection(notes)
        .add(note.toMap())
        .whenComplete(() => isDone = true);
    getallNotes();
    return isDone;
  }

  updateNoteStatus(Note note) async {
    print(this.value);
    note.status=value!;
    updatenote(note);
   

    // allNotes.forEach((element)async {
    //   if (element.id == notid) {
    //     element.status = value!;
    //     await updatenote(element);

    //   }
    // });
  }

  updatenote(Note note) {
    String id = note.id!;
    Map<String, dynamic> data = note.toMap();
    data.remove("id");
    dbobjec.collection(notes).doc(id).update(data);
    getallNotes();
  }

  delete(String id) {
    dbobjec.collection(notes).doc(id).delete();
    getallNotes();
  }
}
