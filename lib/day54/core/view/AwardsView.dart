// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/day54/constant/filespath.dart';
import 'package:flutter_practis/day54/core/viewmodel/AwardsViewModel.dart';
import 'package:flutter_practis/day54/core/viewmodel/AwardsViewModel.dart';
import 'package:flutter_practis/day54/helper/dbmanager.dart';
import 'package:flutter_practis/day54/helper/filemanager.dart';

class AwardsView extends StatefulWidget {
  int id;
  AwardsView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<AwardsView> createState() => _AwardsViewState();
}

class _AwardsViewState extends State<AwardsView> {
  AwardsViewModel avm = AwardsViewModel();
  TextEditingController txt=TextEditingController();
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
          future: avm.getAwards(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.amber,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 20,
                      height: 30,
                      child: Text(snapshot.data![index].name.toString()),
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
                          onPressed: ()async {
                             int?d=await avm.AddAward({
                              DBManaer.COL_NAME:txt.text,
                              DBManaer.COL_ACTOR_ID:widget.id
                            });
                            print(d);
                            if (d!=null && d>0) {
                            setState(() {
                              
                            });
                            }
                            Navigator.pop(context, true);
                          },
                          child: Text("Create new"))
                    ],
                  ),
                );
              });
             if (v!=null && v!) {
             setState(() {
               
             });
             }
             
        }, child: Text("Add")) ,
        
        );
  }
}
