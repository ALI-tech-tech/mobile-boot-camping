import 'package:flutter/material.dart';
import 'package:flutter_practis/day57/db_helper.dart';
import 'package:flutter_practis/day57/entites/department.dart';
import 'package:flutter_practis/day57/entites/student.dart';
import 'package:flutter_practis/day57/view/department/students_department.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  TextEditingController _textController = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Department"),
      ),
      body: FutureBuilder(
          future: DBHelper.database.departmentDao.getAllDepartments(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Department>> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isEmpty
                  ? Text('Empty')
                  : ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDepartmentScreen(dept: snapshot.data![index]),));
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
                          trailing: IconButton(onPressed: (){
                            DBHelper.database.studentDao.updateStudentListByDeptId(snapshot.data![index].id!);
                            DBHelper.database.departmentDao.deleteDepartment(snapshot.data![index].id!);
                            setState(() {
                              
                            });
                            
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
                title: Text('Add New Depaertment '),
                content: Form(
                  key: fkey,
                  child: TextFormField(
                    controller: _textController,
                    validator: (value) =>
                        value!.isEmpty ? "pleas enter Department" : null,
                    decoration: InputDecoration(
                      labelText: 'Enter some text',
                    ),
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
                        await DBHelper.database.departmentDao.AddDepartment(
                            Department(name: _textController.text));
                        print('Entered text: $enteredText');
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
          label: Text("New Department")),
    );
  }
}
