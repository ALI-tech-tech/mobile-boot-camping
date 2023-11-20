// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/day57/db_helper.dart';
import 'package:flutter_practis/day57/entites/course.dart';
import 'package:flutter_practis/day57/entites/department.dart';
import 'package:flutter_practis/day57/entites/reg_course.dart';
import 'package:flutter_practis/day57/entites/student.dart';

class CourseStudentScreen extends StatefulWidget {
  Student s;
  CourseStudentScreen({
    Key? key,
    required this.s,
  }) : super(key: key);

  @override
  State<CourseStudentScreen> createState() => _CourseStudentScreenState();
}

class _CourseStudentScreenState extends State<CourseStudentScreen> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _hController = TextEditingController();
  int selected = 1;
  int selectedcourse=1;
  GlobalKey<FormState> fkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50, 
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width-20,
              decoration: BoxDecoration(
                color: Colors.indigo[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: FutureBuilder(
                  future:DBHelper.database.departmentDao.getOneDepartment(widget.s.departmentId!) ,
                  builder: (context, snapshot) { 
                  if(snapshot.hasData)
                 return  Text(snapshot.data!.name!, style: TextStyle(color: Colors.white, fontSize: 20),);
                 return Text("Not found Department");
                 }),
              ),
            ),
            FutureBuilder(
                future: DBHelper.database.regcoursedao
                    .getRegisteredCoursesByStudentId(widget.s.id!),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.isEmpty
                        ? Text('Empty')
                        : SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                return ListTile(
                                  leading: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Text(snapshot.data![index].id!.toString()),
                                  ),
                                  title: Text(snapshot.data![index].name!),
                                  subtitle:
                                      Text(snapshot.data![index].hours!.toString()),
                                  trailing: IconButton(onPressed: (){
                                    
                                    DBHelper.database.regcoursedao.deleteRegisteredCourse(RegCourse(CourseId:snapshot.data![index].id!, StudentId: widget.s.id ));
                                    setState(() {
                                      
                                    });
                                  }, icon: Icon(Icons.delete)),
                                );
                              }),
                        );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
          onPressed: () async {
            
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Add New Course'),
                content: Form(
                  key: fkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FutureBuilder(
                        future: DBHelper.database.coursedao.getAllCoursesWithoutRegster(widget.s.id!),
                        builder: (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
                          if (snapshot.hasData) {
                            selectedcourse=snapshot.data![0].id!;
                          return  StatefulBuilder(
                            builder: (BuildContext context, setState) {
                              return DropdownButton(
                            value: selectedcourse,
                            items: snapshot.data!
                                .map((fc) => DropdownMenuItem<int>(
                                      child: Text(fc.name!),
                                      value: fc.id,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              
                              selectedcourse=value!;
                              setState(() {});
                            },
                          );
                            },
                          );
                        
                          }
                          return Text("nodata");
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () async {
                      String enteredText = _textController.text;
                      if (fkey.currentState!.validate()) {
                        await DBHelper.database.regcoursedao.insertRegisteredCourse(RegCourse(StudentId: widget.s.id, CourseId:selectedcourse ));
                        setState(() {});
                        Navigator.pop(context);
                      }
                      print('Entered text: $enteredText');
                    },
                  ),
                ],
              ),
            );
          },
          icon: Icon(Icons.add),
          label: Text("Register Course")),
    );
  }
}
