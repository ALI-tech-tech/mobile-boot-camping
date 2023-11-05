import 'package:flutter/material.dart';
import 'package:flutter_practis/day48/model/Course.dart';

Edit(BuildContext context, Course dept) async {
  TextEditingController txt = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  txt.text = dept.name!;
  return await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 200,
                    child: TextField(
                      controller: txt,
                    ),
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      controller: txt2,
                    ),
                  ),
                  Checkbox(
                      value: dept.active,
                      onChanged: (v) {
                        dept.active = v!;
                        setState(() {});
                      }),
                  ElevatedButton(
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "name": txt.text,
                          "active": dept.active,
                          "credits":txt2.text,
                        };
                        List<dynamic> d = [
                          dept.id,
                          data,
                          
                        ];
                        Navigator.pop(context, d);
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
