
/*
8) Write a program to find the longest word in a text file.
*/
//import this package to use File class and read/write on file
import 'dart:io';

void main(List<String> args) async{
  //after create file in my directory name q8.txt & write in it some words
  //File class for operation on file
  File f=new File("q8.txt");
  //get file content using f.readAsString  
  String cont=await f.readAsString();
  //change string file content and split  to list
  List<String> infolist=cont.split(" ");
  //map for save max and word every time in loop and the values default 
  Map<String,dynamic> li={"max":0,"word":" "};
  //loop & if for check elements to find longest word and replace max and word in map 
  //if condition true
  infolist.forEach((element) {
    if (element.length>li["max"]) {
      li["max"]=element.length;
      li["word"]=element;
    }
  },);
  //print longest word after check
  print("the word longest is : ${li["word"]}");
}