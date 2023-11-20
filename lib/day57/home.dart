import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/day57/db_helper.dart';
import 'package:flutter_practis/day57/entites/student.dart';
import 'package:flutter_practis/day57/routes/app_routs.dart';
import 'package:flutter_practis/day57/view/widgets/mydrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> named=["Student","Department", "Course"];
  List<Color> colors=[Colors.teal,Colors.red,Colors.blue];
  List<String> basicrouts=[AppRoutes.studentScreen, AppRoutes.deptScreen, AppRoutes.courseScreen];
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
        
        appBar: AppBar(
          title: Text('Admin'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.switch_account))
          ],
        ),
        body:
        ListView(
          padding: EdgeInsets.only(left: 20, right: 20),
          children:List.generate(named.length, (index) => Card(color: colors[index].withOpacity(0.7), title: named[index], callback: (){
            Navigator.pushNamed(context, basicrouts[index]);
          })),
        )
      
   
    );
  }

  Widget Card({required Color color,required String title,required Function? callback()}){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color:color ,
        borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        onTap:callback ,
        title: Text(title, style: TextStyle(color: Colors.white),),
        trailing: Text(""),
      ),
    );
  }
}