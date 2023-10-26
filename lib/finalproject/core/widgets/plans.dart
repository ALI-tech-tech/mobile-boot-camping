// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/finalproject/features/model/subscripplan.dart';

class plan extends StatefulWidget {
  SubscripPlan s;
  bool active = false;

  BuildContext? context;

  plan({
    Key? key,
    required this.s,
    this.active = false,
    required this.context,
  }) : super(key: key);

  @override
  State<plan> createState() => _planState();
}

class _planState extends State<plan> {
  List<String> headplan = [
    "Monthly Price",
    "Multiple Device",
    "Cancel any Time",
    "Resolution"
  ];
  var width;

  Color? titlecolor = Colors.white;
  Color? contcolor = Colors.amber;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    width = (MediaQuery.of(widget.context!).size.width / 3) - 20;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 400,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                headplan[0],
                style: TextStyle(
                    color: widget.active ? Colors.white : Colors.grey),
              ),
              Text(
                "${(widget.s.monthlyprice)}",
                style: TextStyle(
                    color: widget.active ? Colors.amber : Colors.grey),
              ),
              const Divider(color: Colors.white, height: 10),
              Text(
                headplan[1],
                style: TextStyle(
                    color: widget.active ? Colors.white : Colors.grey),
              ),
              Text(
                "${(widget.s.multipledevice)}",
                style: TextStyle(
                    color: widget.active ? Colors.amber : Colors.grey),
              ),
              const Divider(color: Colors.white, height: 10),
              Text(
                headplan[2],
                style: TextStyle(
                    color: widget.active ? Colors.white : Colors.grey),
              ),
              Text(
                "${(widget.s.Cancelanytime)}",
                style: TextStyle(
                    color: widget.active ? Colors.amber : Colors.grey),
              ),
              const Divider(color: Colors.white, height: 10),
              Text(
                headplan[3],
                style: TextStyle(
                    color: widget.active ? Colors.white : Colors.grey),
              ),
              Text(
                "${(widget.s.resolution)}",
                style: TextStyle(
                    color: widget.active ? Colors.amber : Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget plann(BuildContext context, String title, List<List<String>> content) {

//   return
//   Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       TextButton(

//           style: ElevatedButton.styleFrom(
//               backgroundColor:isEnable?Colors.amber:Colors.grey[700],
//               minimumSize: Size(width, 80)),
//           onPressed: () {
//             isEnable=!isEnable;

//           },
//           child: Text(
//             title,
//             style: TextStyle(color: Colors.white),
//           )),
//       SizedBox(
//         height: 5,
//       ),
//       AbsorbPointer(
//         absorbing: isEnable,
//         child: SizedBox(

//           height: 400,
//           width: width,
//           child: ListView.separated(

//               itemBuilder: (ctx, index) => SizedBox(
//                     height: 80,
//                     child: Column(

//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(content[index][0]),
//                         Text(
//                           content[index][1],
//                           style: TextStyle(color: Colors.amber),
//                         ),
//                       ],
//                     ),
//                   ),
//               separatorBuilder: (context, index) => Divider(),
//               itemCount: content.length),
//         ),
//       )
//     ],
//   );

// }
