// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ManageCourse extends StatefulWidget {
  bool active = false;
  
  TextEditingController txt = TextEditingController();
  TextEditingController txt2 = TextEditingController();

  ManageCourse({
    Key? key,
    required this.active,
    
  }) : super(key: key);

  @override
  State<ManageCourse> createState() => _ManageCourseState();
}

class _ManageCourseState extends State<ManageCourse> {
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
          SizedBox(height: 10,),
          TextField(
            controller: widget.txt2,
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
                  "credits":widget.txt.text,
                };
                
                Navigator.pop(context, data);
              },
              child: Text("Submit"))
        ],
      ),
   
    );
  }
}
