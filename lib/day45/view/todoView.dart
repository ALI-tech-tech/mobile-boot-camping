import 'package:flutter/material.dart';
import 'package:flutter_practis/day45/api.dart';
import 'package:flutter_practis/day45/controller/todocontroller.dart';
import 'package:flutter_practis/day45/model/todo.dart';
import 'package:flutter_practis/day45/view/addtodo.dart';

import 'updatetodo.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  TodoController tc = TodoController();
  static const snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );
  API api = API();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.LoadPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: tc.getpost(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.done) {
              if (snap.hasData) {
                return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Center(
                            child: Text(snap.data![index].id.toString()),
                          ),
                        ),
                        title: Text(snap.data![index].todo.toString()),
                        subtitle: Text((snap.data![index].completed!
                            ? "Completed"
                            : "UnCompleted")),
                        trailing: 
                        PopupMenuButton<int>(
                          onSelected: (result) {
                            if (result == 1) {
                              nav(context, snap.data![index]);
                            }
                          },
                          icon: Icon(Icons.more_vert_outlined),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                onTap: () async {
                                 
                                },
                                value: 1,
                                child: Text("Edit")),
                            PopupMenuItem(
                                onTap: () async {
                                  Map<String, dynamic>? res = await api
                                      .deletepost(snap.data![index].id!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.amber,
                                          content: Text(
                                              " ${snap.data![index].id} is deleted ")));
                                },
                                value: 2,
                                child: Text("Delete")),
                          ],
                        ),
                     
                      );
                    });
              }
            }
            return CircularProgressIndicator();
          }),
      floatingActionButton: Builder(builder: (contextinside) {
        return ElevatedButton(
            onPressed: () async {
              Map<String, dynamic>? data = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTodo(
                            add: true,
                          )));
              if (data != null) {
                Map<String, dynamic> res = await tc.sendpost(data);
                print(res);

                ScaffoldMessenger.of(contextinside).showSnackBar(SnackBar(
                    backgroundColor: Colors.amber,
                    content: Text("Add succes")));
              }
            },
            child: Text("+ Add new todo"));
      }),
    );
  }
}

nav(BuildContext context, TODO td) async {
  API api = API();
  List<dynamic>? data = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UpdateTodo(
                td: td,
              )));
  print(data);

  if (data != null) {
    var res = await api.updatePost(data);
    print(res);

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.amber, content: Text("Edit succes")));
  }
}
