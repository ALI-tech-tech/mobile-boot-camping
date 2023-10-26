// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class RadioWithIcon extends StatefulWidget {
  
  List<List<dynamic>> content;
  RadioWithIcon({
    Key? key,
    
    required this.content,
  }) : super(key: key);

  @override
  State<RadioWithIcon> createState() => _RadioWithIconState();
}

class _RadioWithIconState extends State<RadioWithIcon> {
  String? gvalue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gvalue = widget.content[0][0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.content.length, (index) =>   Container(
            height: 100,
            // width: (MediaQuery.of(context).size.width / 3) - 20,
            child: Row(
              children: [
                Radio(
                    value: widget.content[index][0],
                    groupValue: gvalue,
                    onChanged: (v) {
                      gvalue = v;
                      setState(() {});
                    }),
                SizedBox(
                  width: MediaQuery.of(context).size.width-80,
                  child: ListTile(
                    title: Text("${widget.content[index][0]}"),
                    subtitle: Text("${widget.content[index][1]}"),
                    trailing: Container(
                      decoration: BoxDecoration(
                        gradient:widget.content[index][2]==Logos.cc_visa? LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                          Colors.transparent,
                          Colors.white,
                          Colors.transparent,
                        ]):null
                      ),
                      
                      child: Logo(widget.content[index][2],)),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        )
          
        
      ),
    );

    ;
  }
}
