// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BlackButton extends StatefulWidget {
    String title;
    VoidCallback callback;
  BlackButton({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);

  @override
  State<BlackButton> createState() => _BlackButtonState();
}

class _BlackButtonState extends State<BlackButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                foregroundColor: Colors.amber,
                minimumSize: Size(MediaQuery.of(context).size.width - 70, 50)),
            onPressed: widget.callback,
            child: Text(widget.title)));
  }
}
