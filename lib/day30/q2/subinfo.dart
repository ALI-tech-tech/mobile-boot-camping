

import 'package:flutter/material.dart';
import 'package:flutter_practis/day30/q2/subject.dart';

class SubjectInfo extends StatefulWidget {
  const SubjectInfo({super.key});

  @override
  State<SubjectInfo> createState() => _SubjectInfoState();
}

class _SubjectInfoState extends State<SubjectInfo> {
  Subject? show;
  int? selected;
  List<Subject> li = [];
  String ss="not selected";
  @override
  void initState() {
    super.initState();
    Subject s1 = Subject(id: 1, name: "mvc", dept: "IT", hour: 3);
    Subject s2 = Subject(id: 2, name: "AI", dept: "CS", hour: 2);
    Subject s3 = Subject(id: 3, name: "OS", dept: "IT", hour:5);
    li.add(s1);
    li.add(s2);
    li.add(s3);
    selected = li[1].id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subject Info"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SizedBox(
                  
                child: DropdownButton(
                    
                    value: selected,
                    items: [
                      for (var i in li)
                        DropdownMenuItem(value: i.id, child: Text("${i.name}")),
                    ],
                    onChanged: (x) {
                      selected = x!;
                      ss=li.firstWhere((element) => element.id==x,).name.toString();
                      
                      setState(() {});
                    }),
              ),
              
              ElevatedButton(onPressed: (){
                show=li.firstWhere((element) => element.id==selected,);
                setState(() {
                  
                });
              }, child: Text("Show Info"))
                   
              ],
                       ),
            ),
            SizedBox(height: 10,),
         Text("$ss"),
         SizedBox(height: 10,),
         if(show!=null)
         Text("${show!.name} , ${show!.hour} h ,  ${show!.dept}")
         ],
      ),
    );
  }
}
