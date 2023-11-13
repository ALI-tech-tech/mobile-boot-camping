import 'package:flutter/material.dart';
import 'package:flutter_practis/day53/core/widget/colmunt.dart';
import 'package:flutter_practis/day53/feature/model/Income.dart';

import 'package:flutter_practis/day53/feature/viwmodel/viewmodelincom.dart';

class SqfliteDRUD extends StatefulWidget {
  const SqfliteDRUD({super.key});

  @override
  State<SqfliteDRUD> createState() => _SqfliteDRUDState();
}

class _SqfliteDRUDState extends State<SqfliteDRUD> {
  IncomViewModel ivm = IncomViewModel();
  TextEditingController amountcont = TextEditingController();
  dynamic income=0;
  dynamic Expenses=0;
  String? type;
  geth() async{
    income=(await ivm.getcountincome("+"));
    Expenses=(await ivm.getcountincome("-"));

    print(income);
  }
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    
     geth();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQFLITE CRUD"),
      ),
      body: SingleChildScrollView(
        child:  FutureBuilder(
                  future: ivm.fetchAllIncome(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return 
                        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  mycolumn(Text("${income}"), Text("Incom")),
                  mycolumn(Text("${Expenses}"), Text("Expenses")),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  EdgeInsets.only(top: 5, left: 15, right: 15),
                              decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                title: Text("${snapshot.data![index].amount}"),
                                subtitle: Text("${snapshot.data![index].type}"),
                                trailing: Container(
                                  width: 200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            amountcont.text = snapshot
                                                .data![index].amount
                                                .toString();
                                            bool? b =
                                                await showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        alignment:
                                                            Alignment.topRight,
                                                        height: 500,
                                                        child: Column(
                                                          children: <Widget>[
                                                            TextField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  amountcont,
                                                            ),
                                                            DropdownButton<
                                                            
                                                                String>(
                                                                  value: snapshot.data![index].type=="+"?"Increse":"decrease",
                                                              items: <String>[
                                                                'Increse',
                                                                'decrease'
                                                              ].map((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child: Text(
                                                                      value),
                                                                );
                                                              }).toList(),
                                                              onChanged: (v) {
                                                                type = v ==
                                                                        "Increse"
                                                                    ? "+"
                                                                    : "-";
                                                              },
                                                            ),
                                                            ElevatedButton(
                                                                onPressed: () {
                                                                  print("${int
                                                                              .parse(
                                                                            amountcont.text,
                                                                          )}, jhjhj ${int
                                                                              .parse(
                                                                            amountcont.text,
                                                                          )}");
                                                                  ivm.updateIncom(
                                                                      Incom(
                                                                        id:snapshot.data![index].id ,
                                                                          amount: int
                                                                              .parse(
                                                                            amountcont.text,
                                                                          ),
                                                                          type:
                                                                              type));
                                                                  Navigator.pop(
                                                                      context,
                                                                      true);
                                                                },
                                                                child: Text(
                                                                    "Create new"))
                                                          ],
                                                        ),
                                                      );
                                                    });
                                            if (b != null && b) {
                                              setState(() {
                                                geth();
                                              });
                                            }
                                          },
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () async {
                                            int v = await ivm.deletIncom(
                                                snapshot.data![index].id!);
                                            if (v > 0) {
                                              setState(() {
                                                geth();
                                              });
                                            }
                                          },
                                          icon: Icon(Icons.delete)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                        )]);
                      }
                    }
                    return CircularProgressIndicator();
                  },
                )),
          
      
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? b = await showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  alignment: Alignment.topRight,
                  height: 500,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: amountcont,
                      ),
                      DropdownButton<String>(
                        items:
                            <String>['Increse', 'decrease'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (v) {
                          type = v == "Increse" ? "+" : "-";
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ivm.saveIncome(Incom(
                                amount: int.parse(
                                  amountcont.text,
                                ),
                                type: type));
                            Navigator.pop(context, true);
                          },
                          child: Text("Create new"))
                    ],
                  ),
                );
              });
          if (b != null && b) {
            setState(() {
              geth();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
