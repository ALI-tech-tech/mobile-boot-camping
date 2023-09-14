

import '../model/book.dart';
import '../mypackage/myfunction.dart';

addbook(List<Map<String,dynamic>> li){
  int id=li.last["id"];
  book b=new book();
  b.id=id+1;
  b.name=input("Enter Book Name :");
  b.Author=input("Enter Book Author :");
  b.Category=input("Enter Book Category :");
  b.Price=checkvalue(input("Enter Book Price :"));
  b.Quantity=checkvalue(input("Enter Book Quantity :"));
  
  return b.mapbook();
}

