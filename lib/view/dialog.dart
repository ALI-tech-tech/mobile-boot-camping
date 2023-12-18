// // Create a method to show the dialog
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../model/note.dart';
// import '../viewmodel/NoteViewModel.dart';

// void showStatusDialog(BuildContext context, Note note) {
//       final noteViewModel = Provider.of<NoteViewmodel>(context);

//    showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Select Status'),
//         content: StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: Status.values.map((status) {
//                 return RadioListTile<Status>(
//                   title: Text(status.value),
//                   value: status,
//                   groupValue: Status.values.byName(note.status),
//                   onChanged: (value) {
//                     noteViewModel.updateNoteStatus(note.id!, value!.value);
                   
//                   },
               
//                   activeColor: (note != null) ? Colors.grey : null,
//                 );
//               }).toList(),
//             );
//           },
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//           ),
//           TextButton(
//             child: Text('OK'),
//             onPressed: () {
//               if (note == null) {
//                 // Handle the selected status
                
//               }
//               Navigator.of(context).pop(); // Close the dialog
//             },
//           ),
//         ],
//       );
//     },
//   );

// }