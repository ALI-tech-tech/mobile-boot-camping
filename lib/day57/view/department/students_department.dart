// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/day57/db_helper.dart';
import 'package:flutter_practis/day57/entites/department.dart';
import 'package:flutter_practis/day57/entites/student.dart';

class StudentDepartmentScreen extends StatefulWidget {
  Department dept;
  StudentDepartmentScreen({
    Key? key,
    required this.dept,
  }) : super(key: key);

  @override
  State<StudentDepartmentScreen> createState() => _StudentDepartmentScreenState();
}

class _StudentDepartmentScreenState extends State<StudentDepartmentScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Department"),
      ),
      body: FutureBuilder(
          future: DBHelper.database.studentDao.getAllStudentDepartment(widget.dept.id!),
          builder:
              (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isEmpty
                  ? Text('Empty')
                  : ListView.builder(
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
                        );
                      });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          }),
   
    );
  }
}
