import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/note.dart';
import '../viewmodel/NoteViewModel.dart';

class BottomSheetForm extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _descController = TextEditingController();
  Note? note;
  BottomSheetForm({this.note}) {
    if (note != null) {
      _titleController.text = note!.title;
      _descController.text = note!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewmodel>(context);

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descController,
            decoration: InputDecoration(labelText: 'description'),
          ),
          (note == null)
              ? DropdownButton<String>(
                  value: noteViewModel.value,
                  onChanged: (newStatus) {
                    noteViewModel.Updatevalue(newStatus!);
                  },
                  items: Status.values.map<DropdownMenuItem<String>>((status) {
                    return DropdownMenuItem<String>(
                      value: status.value,
                      child: Text(status.value),
                    );
                  }).toList(),
                )
              : SizedBox(),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              note == null
                  ? noteViewModel.addNote(Note(
                      title: _titleController.text,
                      description: _descController.text,
                      status: noteViewModel.value))
                  : noteViewModel.updatenote(Note(
                      title: _titleController.text,
                      description: _descController.text,
                      status: note!.status));
              Navigator.pop(context);
            },
            child: Text('Submit'),
          ),
        ],
      ),   
    );
  }
}
