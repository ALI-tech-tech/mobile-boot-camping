import 'package:flutter/material.dart';

class Exchange extends StatefulWidget {
  const Exchange({super.key});

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  TextEditingController Txt=TextEditingController();
  var result=0.0;
  int selected=1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              textAlign: TextAlign.center,
              controller: Txt,
            ),
            RadioListTile(value: 1, groupValue: selected, onChanged: (v){
                selected=v!;
                result=int.parse(Txt.text)*1000;
                setState(() {
                  
                });
            },title: Text("YEMENI"),),
            RadioListTile(value: 2, groupValue: selected, onChanged: (v){
              selected=v!;
                result=(int.parse(Txt.text)/1000) ;
                setState(() {
                  
                });
            },title: Text("SADUI"),),

            Text("${result}"),
            // Row(
            //   children: [
            //     Radio(value: 1, groupValue: selected, onChanged: (v){

            //     }),
            //     Text("YEMENI"),
            //     Radio(value: 1, groupValue: selected, onChanged: (v){

            //     }),
            //     Text("data")
            //   ],
            // )
            
          ],
        )),
      ),
    );
  }
}
