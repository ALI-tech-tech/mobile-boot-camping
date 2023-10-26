// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_practis/finalproject/features/model/subscripplan.dart';

class PlanStylConfirm extends StatefulWidget {
  SubscripPlan s;
  

  BuildContext? context;

  PlanStylConfirm({
    Key? key,
    required this.s,
    
    required this.context,
  }) : super(key: key);

  @override
  State<PlanStylConfirm> createState() => _PlanStylConfirmState();
}

class _PlanStylConfirmState extends State<PlanStylConfirm> {
  List<String> headplan = [
    "Monthly Price",
    "Multiple Device",
    "Vedio Quality",
    "Resolution",
    "Screens you can watch\non at same time"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headplan[0],
                      style: TextStyle(
                          color:  Colors.white ),
                    ),
                    Text(
                      widget.s.monthlyprice.toString(),
                      style: TextStyle(
                          color:  Colors.white ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headplan[1],
                      style: TextStyle(
                          color:  Colors.white ),
                    ),
                    Text(
                      widget.s.multipledevice.toString(),
                      style: TextStyle(
                          color: Colors.white ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headplan[2],
                      style: TextStyle(
                          color: Colors.white ),
                    ),
                    Text(
                      widget.s.resolution.toString(),
                      style: TextStyle(
                          color: Colors.white ),
                    ),
                  ],
                ),
              ),
              Divider(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headplan[3],
                      style: TextStyle(
                          color: Colors.white ),
                    ),
                    Text(
                      widget.s.vedioquality.toString(),
                      style: TextStyle(
                          color: Colors.white ),
                    ),
                  ],
                             ),
               ),
              Divider(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      headplan[4],
                      style: TextStyle(
                          color: Colors.white ),
                    ),
                    Text(
                      widget.s.screens.toString(),
                      style: TextStyle(
                          color: Colors.white ),
                    ),
                  ],
                             ),
               ),
              





              SizedBox(
          height: 50,
        ),
            ],
          ),
        ),
      ],
    );
  }
}
