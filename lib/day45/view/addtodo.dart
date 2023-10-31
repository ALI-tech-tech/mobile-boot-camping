// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/day45/model/todo.dart';

class AddTodo extends StatefulWidget {
  bool add;
  TODO? td;
  AddTodo({
    Key? key,
    required this.add,
    this.td,
  }) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController txt = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!widget.add) {
      txt.text = widget.td!.todo!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.add ? "Add new" : "Edit"),
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
                Navigator.pop(context, data);
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
