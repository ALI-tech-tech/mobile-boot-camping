import 'dart:io';

import 'myfunction.dart';
void main(List<String> args) {
  String name=input("Enter your name : ");
  List<String>listname=name.split(" ");
  for (var i = listname.length-1; i >=0; i--) {
    stdout.write("${listname[i]} ");
  }
}