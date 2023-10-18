import 'package:flutter/material.dart';
import 'package:flutter_practis/day36/controller/CourseController.dart';
import 'package:flutter_practis/day36/view/manageCourse.dart';
import 'package:flutter_practis/day36/widgets/Empty.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  CourseController cc = CourseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Management"),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManageCourse(
                                type: true,
                              ))) ;

                  if (res!=null && res) {
                    setState(() {});
                  }
                },
                child: Text("Add Course"))
          ],
        ),
        CourseController.li.isEmpty
            ? Empty()
            : Expanded(
              child: SizedBox(
                  // height: (60 * CourseController.li.length).toDouble(),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                      itemCount: CourseController.li.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          title: Text(
                            "${CourseController.li[index].name}",
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: Text("${CourseController.li[index].hours}"),
                          trailing: Container(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: IconButton(onPressed: () async{
                                    final res=await Navigator.push(context, MaterialPageRoute(builder: (ctx){
                                      return ManageCourse(type: false, course:CourseController.li[index] ,);
                                    }));
                                    if (res!=null && res ) {
                                      setState(() {
                                        
                                      });
                                    }
                                  }, icon: Icon(Icons.edit,color: Colors.green,)),
                                ),
                                Expanded(
                                  child: IconButton(onPressed: (){
                                    cc.removeCourse(id: CourseController.li[index].Id!);
                                    setState(() {
                                      
                                    });
                                  }, icon: Icon(Icons.delete,color: Colors.red,)),
                                ),
                                
                              ],
                            ),
                          ),
                        );
                      }),
                ),
            )
      ]),
    );
  }
}
