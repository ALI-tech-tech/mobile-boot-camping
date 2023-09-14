
import '../mypackage/myfunction.dart';

addtocart(List<Map<String,dynamic>> cart, List<Map<String,dynamic>> li){
  List<Map<String,dynamic>> cartresult=cart;
  if (cart.length<3) {
    print("Add Book to the cart by it's id");
    String id=input("Enter Book id to add it to the cart : ");
    if (isdigit(id)) {
    li.forEach((element) {
      if (element["id"]==int.parse(id)) {
        if (!li.contains(element)) {
          cartresult.add(element);
        }else{
          print("$element is not found");
        }
        
      }
    });
    
    print("ADD done");
  }  
  }else{
    print("can not add to cart because its full (have 3 books)");
  }
  
  return cartresult;
}