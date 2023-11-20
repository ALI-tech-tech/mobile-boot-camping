// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/day57/db_helper.dart';
import 'package:flutter_practis/day57/entites/course.dart';
import 'package:flutter_practis/day57/entites/department.dart';
import 'package:flutter_practis/day57/entites/student.dart';

class StudentCourseScreen extends StatefulWidget {
  Course cors;
  StudentCourseScreen({
    Key? key,
    required this.cors,
  }) : super(key: key);

  @override
  State<StudentCourseScreen> createState() => _StudentCourseScreenState();
}

class _StudentCourseScreenState extends State<StudentCourseScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.teal.withOpacity(0.7) ,
        title: Text("Student Course"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 100, 
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width-20,
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: ListTile(
                  title: Text(widget.cors.name!, style: TextStyle(color: Colors.white,fontSize: 25),),
                  subtitle: Text(widget.cors.hours.toString()+" hourse", style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 18)),
                ),
              ),
            ),

            FutureBuilder(
                future: DBHelper.database.studentDao.getAllStudentCourse(widget.cors.id!),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
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
   
    );
  }
}
