import 'package:flutter/material.dart';

Widget textFormFeild(Widget? prefix, String? Hint) {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      prefix: prefix,
      hintText: Hint,
    ),
  );
}
