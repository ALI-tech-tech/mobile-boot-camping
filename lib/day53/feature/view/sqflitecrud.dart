import 'package:flutter/material.dart';
import 'package:flutter_practis/day53/core/widget/colmunt.dart';

class SqfliteDRUD extends StatefulWidget {
  const SqfliteDRUD({super.key});

  @override
  State<SqfliteDRUD> createState() => _SqfliteDRUDState();
}

class _SqfliteDRUDState extends State<SqfliteDRUD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQFLITE CRUD"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  mycolumn(Text("data"), Text("data")),
                  mycolumn(Text("data"), Text("data")),
                ],
              ),
            ),
            Container(
              
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                    color: Colors.teal,
                    child: ListTile(
                      
                      title: Text("data"),
                      subtitle: Text("data"),
                      trailing: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                    ),
                  );
                },)
            )
          ],
        ),
      ),
    );
  }

  
}