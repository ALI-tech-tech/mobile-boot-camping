// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class managDept extends StatefulWidget {
  bool active = false;
  TextEditingController txt = TextEditingController();

  managDept({
    Key? key,
  }) : super(key: key);

  @override
  State<managDept> createState() => _managDeptState();
}

class _managDeptState extends State<managDept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new"),
      ),
      body: 
      Column(
        children: [
          TextField(
            controller: widget.txt,
          ),
          Checkbox(
              value: widget.active,
              onChanged: (v) {
                widget.active = v!;
                setState(() {});
              }),
          ElevatedButton(
              onPressed: () {
                Map<String, dynamic> data = {
                  "name": widget.txt.text,
                  "active": widget.active,
                };
                Navigator.pop(context, data);
              },
              child: Text("Submit"))
        ],
      ),
   
    );
  }
}
