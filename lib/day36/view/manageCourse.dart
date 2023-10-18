import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practis/day36/controller/CourseController.dart';
import 'package:flutter_practis/day36/widgets/TextFildForm.dart';

import '../model/Course.dart';

class ManageCourse extends StatefulWidget {
  bool type;
  Course? course;
  TextEditingController cName = TextEditingController();
  TextEditingController cHours = TextEditingController();
  // CourseController cp;
  ManageCourse({super.key, required this.type, this.course}) {
    if (type == false) {
      cName.text = course!.name!;
      cHours.text = course!.hours!.toString();
    }
  }

  
  @override
  State<ManageCourse> createState() => _ManageCourseState();
}

class _ManageCourseState extends State<ManageCourse> {
  CourseController cc = CourseController();

  GlobalKey<FormState> fKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.type ? "Add Course" : "Edit Course"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                    key: fKey,
                    child: Column(
                      children: [
                        TextFildForm(
                          
                          controller: widget.cName,
                          filter: FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Zء-ي]')),
                          hint: "Course Name",
                          type: TextInputType.name,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFildForm(
                          controller: widget.cHours,
                          filter: FilteringTextInputFormatter.allow(
                              RegExp('[0-9]')),
                          hint: "Course Hours",
                          type: TextInputType.number,
                        ),
                      ],
                    )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),

                  ),
                    onPressed: () {
                      if (fKey.currentState!.validate()) {
                      widget.type
                          ? cc.addCourse(
                              name: widget.cName.text,
                              hour: int.parse(widget.cHours.text))
                          : cc.editCourse(
                              id: widget.course!.Id!,
                              name: widget.cName.text,
                              h: int.parse(widget.cHours.text));

                      Navigator.pop(context, true);
                      }
                      
                    },
                    child: Text(widget.type ? "add" : "save"))
              ],
            ),
          ),
        ));
  }
}
