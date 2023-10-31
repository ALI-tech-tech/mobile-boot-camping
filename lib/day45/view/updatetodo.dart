// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/day45/model/todo.dart';

class UpdateTodo extends StatefulWidget {
  
  TODO? td;
  UpdateTodo({
    Key? key,
    
    this.td,
  }) : super(key: key);

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  TextEditingController txt = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
      txt.text = widget.td!.todo!;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Edit"),
      ),
      body: Column(
        children: [
          TextField(
            controller: txt,
          ),
          ElevatedButton(
              onPressed: () {
                Map<String, dynamic> data = {
                  
                  "todo": txt.text,
                  "completed": false,
                  "userId": 5,
                };
                int id=widget.td!.id!;
                List<dynamic> li=[data,id];
                Navigator.pop(context, li);
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
