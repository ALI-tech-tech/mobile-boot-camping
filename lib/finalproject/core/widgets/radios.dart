// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Radios extends StatefulWidget {
  String title;
  List<String> items;
  Radios({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  State<Radios> createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  String? gvalue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gvalue = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),)),
          Wrap(
            direction: Axis.horizontal,
            children: List.generate(
                widget.items.length,
                (index) => Container(
                      width: (MediaQuery.of(context).size.width / 3)-20,
                      child: Row(
                        children: [
                          Radio(

                              value: widget.items[index],
                              groupValue: gvalue,
                              onChanged: (v) {
                                gvalue = v;
                                setState(() {});
                              }),
                          Text(widget.items[index]),
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  
  
  }
}
