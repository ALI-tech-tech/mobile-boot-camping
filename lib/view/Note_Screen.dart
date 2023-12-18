// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../model/note.dart';
// import '../viewmodel/NoteViewModel.dart';
// import 'bottomsheet.dart';
// import 'dialog.dart';

// class NoteView extends StatelessWidget {
//   TextEditingController _titleController = TextEditingController();

//   TextEditingController _descController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final noteViewModel = Provider.of<NoteViewmodel>(context);

//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Notes'),
//         ),
//         body: Column(
//           children: [
//             Expanded(child: Consumer<NoteViewmodel>(
//               builder: (context, nvm, child) {
//                 return ListView.builder(
//                   itemCount: noteViewModel.allNotes.length,
//                   itemBuilder: (context, index) {
//                     final note = nvm.allNotes[index] as Note;
//                     return ListTile(
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(note.title),
//                           Container(
//                             height: 15,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Text(note.status),
//                           ),
//                         ],
//                       ),
//                       subtitle: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(note.description),
//                           note.status != Status.Done.value
//                               ? PopupMenuButton<String>(
//                                   icon: Icon(Icons.settings),
//                                   onSelected: (value) {
//                                     if (value == "3") {
//                                       noteViewModel.delete(note.id!);
//                                     } else if (value == "2") {
//                                       _titleController.text = note.title;
//                                       _descController.text = note.description;
//                                       showModalBottomSheet(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return Container(
//                                             padding: EdgeInsets.all(16.0),
//                                             child: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 TextField(
//                                                   controller: _titleController,
//                                                   decoration: InputDecoration(
//                                                       labelText: 'Title'),
//                                                 ),
//                                                 TextField(
//                                                   controller: _descController,
//                                                   decoration: InputDecoration(
//                                                       labelText: 'description'),
//                                                 ),
//                                                 SizedBox(height: 16.0),
//                                                 ElevatedButton(
//                                                   onPressed: ()async {
//                                                     await noteViewModel.updatenote(
//                                                         Note(
//                                                           id: note.id,
//                                                             title:
//                                                                 _titleController
//                                                                     .text,
//                                                             description:
//                                                                 _descController
//                                                                     .text,
//                                                             status:
//                                                                 note.status));
//                                                                 print(note.id);
//                                                     Navigator.pop(context);
//                                                   },
//                                                   child: Text('Submit'),
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       );
//                                     } else if (value == "1") {
//                                       showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return AlertDialog(
//                                             title: Text('Select Status'),
//                                             content: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children:
//                                                   Status.values.map((status) {
//                                                 return Consumer<NoteViewmodel>(
//                                                   builder:
//                                                       (context, value, child) {
//                                                       return RadioListTile<
//                                                         Status>(
//                                                       title: Text(
//                                                           status.value),
//                                                       value: status,
//                                                       groupValue: Status
//                                                           .values
//                                                           .firstWhere((element) =>
//                                                               element
//                                                                   .value ==
//                                                               note.status),
//                                                       onChanged:Status.values.indexOf(Status.values.firstWhere((element) => element.value==note.status))>=
//                                                     Status.values.indexOf(status)? null: (value) {
//                                                         noteViewModel
//                                                             .updateNoteStatus(
//                                                                 note.id!,
//                                                                 value!
//                                                                     .value);
//                                                       },
//                                                       activeColor:
//                                                           (note != null)
//                                                               ? Colors.grey
//                                                               : null,
//                                                     );
//                                                   },
//                                                 );
//                                               }).toList(),
//                                             ),
//                                             actions: <Widget>[
//                                               TextButton(
//                                                 child: Text('Cancel'),
//                                                 onPressed: () {
//                                                   Navigator.of(context)
//                                                       .pop(); // Close the dialog
//                                                 },
//                                               ),
//                                               TextButton(
//                                                 child: Text('OK'),
//                                                 onPressed: () {
//                                                   if (note == null) {
//                                                     // Handle the selected status
//                                                   }
//                                                   Navigator.of(context)
//                                                       .pop(); // Close the dialog
//                                                 },
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       );
//                                     }
//                                   },
//                                   itemBuilder: (BuildContext context) =>
//                                       <PopupMenuEntry<String>>[
//                                     PopupMenuItem<String>(
//                                       value: '1',
//                                       child: ListTile(
//                                         leading: Icon(Icons.update),
//                                         title: Text('Update status'),
//                                       ),
//                                     ),
//                                     PopupMenuItem<String>(
//                                       value: '2',
//                                       child: ListTile(
//                                         leading: Icon(Icons.edit),
//                                         title: Text('Edite'),
//                                       ),
//                                     ),
//                                     PopupMenuItem<String>(
//                                       value: '3',
//                                       child: ListTile(
//                                         leading: Icon(Icons.delete),
//                                         title: Text('Delete'),
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               : SizedBox(),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             )),
//           ],
//         ),
//         floatingActionButton: ElevatedButton.icon(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return Container(
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextField(
//                           controller: _titleController,
//                           decoration: InputDecoration(labelText: 'Title'),
//                         ),
//                         TextField(
//                           controller: _descController,
//                           decoration: InputDecoration(labelText: 'description'),
//                         ),
//                         Consumer<NoteViewmodel>(
//                           builder: (context, value, child) {
//                             return DropdownButton<String>(
//                               value: noteViewModel.value,
//                               onChanged: (newStatus) {
//                                 noteViewModel.Updatevalue(newStatus!);
//                               },
//                               items: Status.values
//                                   .map<DropdownMenuItem<String>>((status) {
//                                 return DropdownMenuItem<String>(
//                                   value: status.value,
//                                   child: Text(status.value),
//                                 );
//                               }).toList(),
//                             );
//                           },
//                         ),
//                         SizedBox(height: 16.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             noteViewModel.addNote(Note(
//                                 title: _titleController.text,
//                                 description: _descController.text,
//                                 status: noteViewModel.value));
//                             // : noteViewModel.updatenote(Note(
//                             //     title: _titleController.text,
//                             //     description: _descController.text,
//                             //     status: note!.status));
//                             Navigator.pop(context);
//                           },
//                           child: Text('Submit'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//             icon: Icon(Icons.add),
//             label: Text('Add Note')));
//   }
// }
