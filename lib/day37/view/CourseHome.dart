import 'package:flutter/material.dart';
import 'package:flutter_practis/day37/controller/gpacontroller.dart';
import 'package:flutter_practis/day37/widgets/mydropdown.dart';

class CourseHome extends StatefulWidget {
  const CourseHome({super.key});

  @override
  State<CourseHome> createState() => _CourseHomeState();
}

class _CourseHomeState extends State<CourseHome> {
  GpaController gpac = GpaController();
  @override
  void initState() {
    super.initState();
    gpac.getAllGpa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [Text("Your GPA"), Text("0.0")],
                ),
                Column(
                  children: [Text("Total Units"), Text("0")],
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  bool? res = await showDialog(
                          context: context,
                          builder: ((context) => showdialog(context, gpac)))
                      as bool?;
                  if (res != null && res) setState(() {});
                },
                child: Text("+ New Course")),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

showdialog(BuildContext context, GpaController gpa) {
 
  TextEditingController stxt = TextEditingController();
  TextEditingController ctxt = TextEditingController();
  GlobalKey<FormState> gk = GlobalKey();
  return AlertDialog(
    content: Form(
        key: gk,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: stxt,
              validator: (v) {
                if (v!.isEmpty) {
                  return "plaes Enter";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  label: Text("data"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (v) {
                if (v!.isEmpty) {
                  return "plaes Enter";
                } else {
                  return null;
                }
              },
              controller: ctxt,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text("data"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            MyDrop(gpa: gpa),
          ],
        )),
    actions: [
      ElevatedButton(
          onPressed: () {
            if (gk.currentState!.validate()) {
              // sc.addsemester(
              //     Semester(season: stxt.text, year: ctxt.text.toint()));
            }
            Navigator.pop(context, true);
          },
          child: Text("Save"))
    ],
  );
}
