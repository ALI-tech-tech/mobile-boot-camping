
import 'dart:convert';
import 'dart:io';

readJsonFile(String filePath)  {
  String input =  File(filePath).readAsStringSync();
  if (!input.isEmpty) {
    var map = jsonDecode(input);
    return map;
  }
  return [];
  
}