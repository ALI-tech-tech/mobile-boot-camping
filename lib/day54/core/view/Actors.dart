import 'package:flutter/material.dart';
import 'package:flutter_practis/day54/constant/filespath.dart';
import 'package:flutter_practis/day54/core/view/AwardsView.dart';
import 'package:flutter_practis/day54/core/viewmodel/ActorsViewModel.dart';
import 'package:flutter_practis/day54/core/viewmodel/AwardsViewModel.dart';
import 'package:flutter_practis/day54/helper/dbmanager.dart';
import 'package:flutter_practis/day54/helper/filemanager.dart';

class ActorsView extends StatefulWidget {
  const ActorsView({super.key});

  @override
  State<ActorsView> createState() => _ActorsViewState();
}

class _ActorsViewState extends State<ActorsView> {
  TextEditingController txt=TextEditingController();
  ActorsViewModel avm = ActorsViewModel();
  AwardsViewModel w=AwardsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: avm.getAllActors(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                       
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return AwardsView(id:snapshot.data![index].id!);
                        },));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 20,
                        height: 30,
                        child: Text(snapshot.data![index].name.toString()),
                      ),
                    );
                  },
                );
              }
            }
            return CircularProgressIndicator();
          },
          
        ),
        floatingActionButton:ElevatedButton(onPressed: ()async{
          txt.clear();
           bool? v= await showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  alignment: Alignment.topRight,
                  height: 500,
                  child: Column(
                    children: <Widget>[
                      TextField(
                       
                        controller: txt,
                      ),
                      ElevatedButton(
                          onPressed: () {
                             avm.AddActor({
                              DBManaer.COL_NAME:txt.text
                            });
                            Navigator.pop(context, true);
                          },
                          child: Text("Create new"))
                    ],
                  ),
                );
              });
             if (v!) {
             setState(() {
               
             });
             }
             
        }, child: Text("Add")) ,
        
        );
  }
}
