import 'package:flutter/material.dart';
import 'package:flutter_practis/day57/db_helper.dart';
import 'package:flutter_practis/day57/entites/course.dart';
import 'package:flutter_practis/day57/entites/department.dart';
import 'package:flutter_practis/day57/view/course/student_course.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _hController = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: FutureBuilder(
          future: DBHelper.database.coursedao.getAllCourses(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isEmpty
                  ? Text('Empty')
                  : ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentCourseScreen(cors:snapshot.data![index] ),));
                          },
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
                            DBHelper.database.regcoursedao.deleteRegisteredCourseByCourseid(snapshot.data![index].id!);
                            DBHelper.database.coursedao.deleteCourse(snapshot.data![index]);
                          }, icon: Icon(Icons.delete)),
                        );
                      });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          }),
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
                      TextFormField(
                        controller: _textController,
                        validator: (value) =>
                            value!.isEmpty ? "pleas enter course" : null,
                        decoration: InputDecoration(
                          labelText: 'Enter Course',
                        ),
                      ),
                      TextFormField(
                        controller: _hController,
                        validator: (value) =>
                            value!.isEmpty ? "pleas enter hours" : null,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter hours',
                        ),
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
                        await DBHelper.database.coursedao.insertCourse(Course(
                            name: _textController.text,
                            hours: int.parse(_hController.text)));
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
          label: Text("New Course")),
    );
  }
}
