import 'package:flutter/material.dart';

class Textwidget extends StatefulWidget {
  const Textwidget({super.key});

  @override
  State<Textwidget> createState() => _TextwidgetState();
}

class _TextwidgetState extends State<Textwidget> {
  int counter=1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: ListView.builder(
              itemCount: counter,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 5, 5),
                  child: Text("Text ${index+1}"),
                );
              },
            ),),
            ElevatedButton(onPressed: (){
              counter++;
              setState(() {
                
              });
            }, child: Text("ADD TEXT WIDGET"))
          ],
        ),
      ),
    );
  }
}