


printbooks(List<Map<String,dynamic>> li){
  
  print("------------------------------------------------\n>>> ");
      
      li.forEach((element) { 
        String msg=(element["quantity"]==0?"Sold Out":"Available");
        String book='''
[${element["name"]}](${element["id"]}) -- Author :${element["author"]}, Quantity :${element["quantity"]}, Price :${element["price"]}, Category :${element["category"]}, status :$msg''';
        print(book);
      });
    print("------------------------------------------------");

}