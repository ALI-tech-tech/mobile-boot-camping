import 'package:flutter/material.dart';
import 'package:flutter_practis/day28/Todo/controller/TaskController.dart';
import 'package:flutter_practis/day28/Todo/model/task.dart';
import 'package:flutter_practis/day28/widget/inputdecration.dart';

class ViewTask extends StatefulWidget {
  const ViewTask({super.key});

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  GlobalKey<FormState> mykey = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController descrption = TextEditingController();
  TaskController tc = TaskController(task: Task(), vtask: ViewTask());
  String titleButton = "ADD";
  String old = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: mykey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (v) => v!.length < 3 ? "title length <3" : null,
                  controller: title,
                  decoration: myinputdecoration.deco(),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (v) => v!.length < 10 ? "title length <10" : null,
                  controller: descrption,
                  decoration: myinputdecoration.deco(),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (mykey.currentState!.validate()) {
                        if (titleButton == "ADD") {
                          tc.addTask(
                              title: title.text, Descripton: descrption.text);
                        } else {
                          tc.editTask(
                              oldtitle: old,
                              newTitle: title.text,
                              newDescription: descrption.text);
                          titleButton = "ADD";
                        }

                        title.clear();
                        descrption.clear();
                        setState(() {});
                      }
                    },
                    child: Text(titleButton)),
                SizedBox(
                  height: 25,
                ),
                Text("Tasks List"),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: tc.tasks.length,
                        itemBuilder: (ctx, index) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: ListTile(
                                    leading: Container(
                                      width: 20,
                                      height: 20,
                                      color: Colors.purple,
                                      child: Center(
                                          child: Text(
                                        "${index + 1}",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    title: Text("${tc.tasks[index].title}"),
                                    subtitle:
                                        Text("${tc.tasks[index].description}"),
                                    trailing: IconButton(
                                        onPressed: () {
                                          title.text = tc.tasks[index].title!;
                                          descrption.text =
                                              tc.tasks[index].description!;
                                          titleButton = "EDIT";
                                          old = tc.tasks[index].title!;
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.edit))),
                              ),
                              Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        tc.removeTask(
                                            title: tc.tasks[index].title);
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.delete)))
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
