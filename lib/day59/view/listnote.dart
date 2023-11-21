import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


import '../model/note.dart';


class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  late Box<Note> noteBox;
  TextEditingController _titleController=TextEditingController();
  TextEditingController _contentController=TextEditingController();
  @override
  void initState() {
    super.initState();
    noteBox = Hive.box<Note>('notes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note List'),
      ),
      body: ListView.builder(
        itemCount: noteBox.length,
        itemBuilder: (context, index) {
          Note note = noteBox.getAt(index)!;
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: IconButton(
              icon: Icon(Icons.check, color: noteBox.getAt(index)!.isCompleted!?Colors.green:Colors.red,),
              onPressed: ()async {
                bool?v= await 
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: ElevatedButton(onPressed: (){
                        Note n;
                n= noteBox.getAt(index)!;
                n.isCompleted=true;
                Navigator.pop(context,true);
                      }, child: Text("Mark as Complete")),
                    
                  );
                  
                }
                
              );
                if(v!=null && v){
                setState(() {
                  
                });
              }
                
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          _contentController.clear();
          _titleController.clear();
          bool? v= await 
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              content: Form(child: Column(
                mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                
                final newNote = Note(
                  title: _titleController.text,
                  content: _contentController.text,
                
                );
                noteBox.add(newNote);

                
                Navigator.pop(context, true);
              },
              child: Text('Save Note'),
            ),
          ],
        ),),
            );
            
          } 
          
          ,);
        if (v!=null && v) {
          setState(() {
            
          });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}