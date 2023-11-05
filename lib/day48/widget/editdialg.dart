import 'package:flutter/material.dart';
import 'package:flutter_practis/day48/model/department.dart';

dialog(BuildContext context, Department dept) async {
  TextEditingController txt = TextEditingController();
  txt.text=dept.name!;
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
                  Checkbox(
                      value: dept.active,
                      onChanged: (v) {
                        dept.active = v!;
                        setState(() {
                  
                   });
                      }),
                  ElevatedButton(
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "name": txt.text,
                          "active": dept.active,
                        };
                        List<dynamic> d = [
                          data,
                          dept.id,
                        ];
                        Navigator.pop(context, d);
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          )
          ;
          },
        );
      },
      
          );
}
