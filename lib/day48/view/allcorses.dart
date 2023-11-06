// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';


import 'package:flutter_practis/day48/controller/coursecontroller.dart';
import 'package:flutter_practis/day48/model/Course.dart';
import 'package:flutter_practis/day48/view/adddept.dart';
import 'package:flutter_practis/day48/view/managecourse.dart';
import 'package:flutter_practis/day48/widget/editcourse.dart';
import 'package:flutter_practis/day48/widget/editdialg.dart';
import 'package:flutter_practis/day48/widget/mycard.dart';

class CourseScreen extends StatefulWidget {
  String id;
  CourseScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  CourseController Dc = CourseController();
  TextEditingController txt = TextEditingController();
  List<Course> li = [];
  Future<List<Course>> getdata() async {
    li = await Dc.getCourse(id:widget.id);
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
        title: const Text('Courses'),
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
                                      await Edit(context, snap.data![index]);

                                  if (data != null) Dc.edit(data[0],data[1],widget.id);

                                   getdata();
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
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
                                          await Dc.delet(widget.id,snap.data![index].id!);
                                          if (res is Course) {
                                          //  getdata();
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.amber,
                                              content: Text(
                                                  " ${snap.data![index].id} is deleted ")));
                                          }
                                          else  {
                                            // getdata();
                                            setState(() {
                                              
                                            });
                                           ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.amber,
                                              content: Text(
                                                  " ${snap.data![index].id} is deleted ")));
                                          }
                                          
                                     
                                    },
                                    value: 2,
                                    child: Text("Delete")),
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
                  builder: (context) =>ManageCourse(active: false) ,
                ));
            if (data != null) {
              Dc.adddept(data, widget.id);
              getdata();
              setState(() {});
            }
          },
          child: Text("Add")),
    );
  }
}