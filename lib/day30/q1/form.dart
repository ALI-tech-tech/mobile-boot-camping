import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practis/day30/q1/table.dart';
import 'package:flutter_practis/day30/q1/userinfo.dart';

class Formvalid extends StatefulWidget {
  const Formvalid({super.key});

  @override
  State<Formvalid> createState() => _FormvalidState();
}

class _FormvalidState extends State<Formvalid> {
  List<UserInfo> li=[];
  GlobalKey<FormState> kk = GlobalKey();
  TextEditingController namec = TextEditingController();
  TextEditingController emailc = TextEditingController();
  TextEditingController passc = TextEditingController();
  TextEditingController passc2 = TextEditingController();
  UserInfo? us;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: kk,
              child: Column(
                children: [
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[A-Za-z]+'))
                    ],
                    autofocus: true,
                    maxLength: 3 ,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value!.length < 3 ? "write more 2 char" : null,
                    controller: namec,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {},
                    controller: emailc,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value!.length < 6 ? "write more 5 char" : null,
                    controller: passc,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        passc.text == value ? null : "pass not mach",
                    controller: passc2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        namec.clear();
                      },
                      child: Text("Clear name")),
                  ElevatedButton(
                      onPressed: () {
                        //kk.currentState!.reset();
                        namec.clear();
                        emailc.clear();
                        passc2.clear();
                        passc.clear();
                      },
                      child: Text("Clear all")),
                  ElevatedButton(
                      onPressed: () {
                        li.add(us=UserInfo(name: namec.text, pass: passc.text, phone: int.parse(emailc.text)));
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(title: Text("Confirm Order"),content: Text("Are you sure ?"),
                        actions: [
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Cancel")),
                          ElevatedButton(onPressed: (){
                            //us=UserInfo(name: namec.text, pass: passc.text, phone: int.parse(emailc.text));
                            Navigator.push(context, MaterialPageRoute(builder:(context) => MyTable(li: li,)));
                          }, child: Text("submit")),
                        ],
                        );

                           
                           
                            
                          },
                        );
                      },
                      child: Text("Finsh")),
                ],
              )),
        ),
      ),
    );
  }
}





// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});

//   @override
//   State<MyCustomForm> createState() => _MyCustomFormState();
// }

// // Define a corresponding State class.
// // This class holds data related to the Form.
// class _MyCustomFormState extends State<MyCustomForm> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     // Start listening to changes.
//     myController.addListener(_printLatestValue);
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is removed from the widget tree.
//     // This also removes the _printLatestValue listener.
//     myController.dispose();
//     super.dispose();
//   }

//   void _printLatestValue() {
    
//     final text = myController.text;
//     print('Second text field: $text (${text.characters.length})');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Retrieve Text Input'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               onChanged: (text) {
                
//                 print('First text field: $text (${text.characters.length})');
//               },
//             ),
//             TextField(
//               controller: myController,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }