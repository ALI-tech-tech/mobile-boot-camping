import 'package:flutter/material.dart';
import 'package:flutter_practis/day37/view/CourseHome.dart';
import 'package:flutter_practis/day48/controller/deptcontroller.dart';
import 'package:flutter_practis/day48/model/department.dart';
import 'package:flutter_practis/day48/view/adddept.dart';
import 'package:flutter_practis/day48/view/allcorses.dart';
import 'package:flutter_practis/day48/widget/editdialg.dart';

import 'widget/mycard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        title: 'Material App',
        home: DeptScreen());
  }
}

class DeptScreen extends StatefulWidget {
  const DeptScreen({super.key});

  @override
  State<DeptScreen> createState() => _DeptScreenState();
}

class _DeptScreenState extends State<DeptScreen> {
  DeptController Dc = DeptController();
  TextEditingController txt = TextEditingController();
  List<Department> li = [];
  Future<List<Department>> getdata() async {
    li = await Dc.getdept();
    return li;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department'),
      ),
      body: FutureBuilder(
          future: getdata(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.done) {
              if (snap.hasData) {
                return ListView.builder(
                    itemCount: li.length,
                    itemBuilder: (ctx, index) {
                      return customContainer(
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.only(top: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundColor: snap.data![index].active!
                                    ? Colors.green
                                    : Colors.red,
                                child: Text("${snap.data![index].id}")),
                            title: Text("${snap.data![index].name}"),
                            trailing: PopupMenuButton<int>(
                              onSelected: (result) async {
                                if (result == 1) {
                                  txt.text = snap.data![index].name!;
                                  List<dynamic>? data =
                                      await dialog(context, snap.data![index]);

                                  if (data != null) Dc.edit(data);

                                  getdata();
                                  setState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.amber,
                                          content: Text(
                                              " ${snap.data![index].id} is Edit ")));
                                }
                              },
                              icon: Icon(Icons.more_vert_outlined),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    onTap: () async {},
                                    value: 1,
                                    child: Text("Edit")),
                                PopupMenuItem(
                                    onTap: () async {
                                      dynamic? res =
                                          await Dc.delet(snap.data![index].id!);
                                      if (res is Department) {
                                        getdata();
                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.amber,
                                                content: Text(
                                                    " ${snap.data![index].id} is deleted ")));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.amber,
                                                content: Text(" ${res}")));
                                      }
                                    },
                                    value: 2,
                                    child: Text("Delete")),
                                PopupMenuItem(
                                    value: 1,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CourseScreen(
                                                        id: snap
                                                            .data![index].id!),
                                              ));
                                        },
                                        child: Text("Courses"))),
                              ],
                            ),
                          ));
                    });
              } else
                return CircularProgressIndicator();
            }

            return CircularProgressIndicator();
          }),
      floatingActionButton: ElevatedButton(
          onPressed: () async {
            Map<String, dynamic>? data = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => managDept(),
                ));
            if (data != null) {
              Dc.adddept(data);
              setState(() {});
            }
          },
          child: Text("Add")),
    );
  }
}
