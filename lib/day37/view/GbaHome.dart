import 'package:flutter/material.dart';
import 'package:flutter_practis/MyPackage/Extentios/MyString.dart';
import 'package:flutter_practis/day37/controller/SemesterController.dart';
import 'package:flutter_practis/day37/model/Semester.dart';
import 'package:flutter_practis/day37/view/CourseHome.dart';

import 'Nothing.dart';

class GbaCalocltor extends StatefulWidget {
  const GbaCalocltor({super.key});

  @override
  State<GbaCalocltor> createState() => _GbaCalocltorState();
}

class _GbaCalocltorState extends State<GbaCalocltor> {
  SemesterController sc = SemesterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GBA Calcolater"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sc.listSemesters.length == 0
                ? NoThingToFound()
                : Expanded(
                    child: Column(children: [
                    Container(
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            child: ListTile(
                              title: Text("${sc.listSemesters[0].season}"),
                              trailing: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.edit)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [Text("Your GPA"), Text("3.65")],
                              ),
                              Column(
                                children: [Text("Total Unit"), Text("16")],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        child: ExpansionPanelList(
                            expansionCallback: (panelIndex, isExpanded) {
                              sc.listSemesters[panelIndex].isActive=!isExpanded;
                              setState(() {});
                            },
                            children: List.generate(
                              sc.listSemesters.length,
                              (index) => ExpansionPanel(
                                  isExpanded: sc.listSemesters[index].isActive,
                                  headerBuilder: (ctx, h) {
                                    return Text("${sc.listSemesters[index].season}");
                                  },
                                  body: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("vscdscd d"),
                                      Text("vscdscd d"),
                                      ElevatedButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> CourseHome()));
                                      }, child: Text("Add Course"))
                                    ],
                                  )),
                                
                            )))
                  ])),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          bool? res = await showDialog(
              context: context,
              builder: ((context) => showdialog(context, sc))) as bool?;
          if (res != null && res) setState(() {});
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(Icons.add_task_rounded), Text("Add Semester")],
        ),
        style: ElevatedButton.styleFrom(maximumSize: Size(170, 40)),
      ),
    );
  }
}

showdialog(BuildContext context, SemesterController sc) {
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
            )
          ],
        )),
    actions: [
      ElevatedButton(
          onPressed: () {
            if (gk.currentState!.validate()) {
              sc.addsemester(
                  Semester(season: stxt.text, year: ctxt.text.toint()));
            }
            Navigator.pop(context, true);
          },
          child: Text("Save"))
    ],
  );
}
