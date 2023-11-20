import 'package:flutter/material.dart';
import 'package:flutter_practis/day57/db_helper.dart';
import 'package:flutter_practis/day57/entites/department.dart';
import 'package:flutter_practis/day57/entites/student.dart';
import 'package:flutter_practis/day57/view/student/student_courses.dart';
import 'package:flutter_practis/day57/view/widgets/mydrawer.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey();
  bool isactive = false;
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: FutureBuilder(
          future: DBHelper.database.studentDao.getAllStudents(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isEmpty
                  ? Text('Empty')
                  : ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CourseStudentScreen(s: snapshot.data![index]),));
                          },
                          child: Card(
                            
                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 50,
                              margin: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                    ),
                                    IconButton(onPressed: (){
                                      DBHelper.database.regcoursedao.deleteRegisteredCourseByStudentid(snapshot.data![index].id!);
                                      DBHelper.database.studentDao.deleteStudent(snapshot.data![index].id!);
                                      setState(() {
                                        
                                      });
                                    }, icon: Icon(Icons.delete), color: Colors.red.withOpacity(0.7),)
                                ]
                                  ),
                                  Center(child: Text("Std.Name: ${snapshot.data![index].name}")),
                                  Divider(),
                                  snapshot.data![index].departmentId!=null?FutureBuilder(
                                    future: DBHelper.database.departmentDao.getOneDepartment(snapshot.data![index].departmentId!),
                                    builder: (context,AsyncSnapshot<Department?> snapshot) {
                                      if (snapshot.hasData) {
                                        
                                      return Text("Std.Department : ${snapshot.data!.name} ");
                                      }
                                      return Text("Not in Department");
                                    }):Text("Not Assigned to department"),
                                  Text("Std.Contact: "),
                                  Text(
                                          "Email: ${snapshot.data![index].email}"),
                                      Text(
                                          "Phone: ${snapshot.data![index].phoneNo}"),
                                  
                                ],
                              ),
                            ),
                          ),
                        );

                        //  Column(
                        //   children: [
                        //     Container(
                        //       width: MediaQuery.of(context).size.width,
                        //       height: 60,
                        //       child: ListTile(
                        //         onTap: (){
                        //           Navigator.push(context, MaterialPageRoute(builder: (context) => CourseStudentScreen(s: snapshot.data![index]),));

                        //         },
                        //         title: Text(snapshot.data![index].name!),
                        //         subtitle: Text(snapshot.data![index].email!),
                        //         trailing: IconButton(onPressed: (){

                        //         }, icon: Icon(Icons.delete)),
                        //       ),
                        //     ),
                        //     Container(
                        //       margin: EdgeInsets.only(left: 15 , right: 15),
                        //       child: Row(
                        //         children: [
                        //           Text(snapshot.data![index].phoneNo.toString()),
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // );
                      });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          }),
      floatingActionButton: ElevatedButton.icon(
          onPressed: () async {
            _emailController.clear();
            _nameController.clear();
            _phoneController.clear();
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(' New Student'),
                content: Form(
                    key: fkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          validator: (value) =>
                              value!.isEmpty ? "Enter Student name" : null,
                        ),
                        TextFormField(
                          validator: (value) =>
                              !isEmail(value!) ? "Enter Correct Email" : null,
                          controller: _emailController,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value!.isEmpty ? "Enter Student Phone" : null,
                          controller: _phoneController,
                        ),
                        StatefulBuilder(
                          builder: (BuildContext context, setState) {
                            return Checkbox(
                              value: isactive,
                              onChanged: (value) {
                                isactive = value!;
                                setState(() {});
                              },
                            );
                          },
                        ),
                        FutureBuilder(
                          future: DBHelper.database.departmentDao
                              .getAllDepartments(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Department>> snapshot) {
                            if (snapshot.hasData) {
                              selected = snapshot.data![0].id!;
                              return StatefulBuilder(
                                builder: (BuildContext context, setState) {
                                  return DropdownButton(
                                    value: selected,
                                    items: snapshot.data!
                                        .map((e) => DropdownMenuItem(
                                            value: e.id, child: Text(e.name!)))
                                        .toList(),
                                    onChanged: (value) {
                                      selected = value!;
                                      setState(() {});
                                    },
                                  );
                                },
                              );
                            }
                            return Text("no department");
                          },
                        ),
                      ],
                    )),
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
                      if (fkey.currentState!.validate()) {
                        Student s = Student(
                            name: _nameController.text,
                            email: _emailController.text,
                            phoneNo: _phoneController.text,
                            active: isactive,
                            departmentId: selected);
                        DBHelper.database.studentDao.AddStudent(s);
                        setState(() {});
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            );
          },
          icon: Icon(Icons.add),
          label: Text("Add Student")),
    );
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
}
