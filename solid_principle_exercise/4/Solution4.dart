/*
-singlton
-Single Responsibility Principle
*/

class Item {
  final int code;
  final double price;
  final double quantity;

  Item(this.code, this.price, this.quantity);

  printitem(){
return "${code}, Price: ${price} ,qty :${quantity}";
  }
}
class Inventory {
  List<Item> stockItems = [
    Item(123, 20.0, 5),
    Item(111, 10.5, 1),
    Item(222, 50.0, 10),
  ];

  bool isINinventory(Item item)=>this.stockItems.contains(item);
}
class ShoppingCart {
  List<Item> cartItems = [];
  static ShoppingCart? _cart=ShoppingCart._shoppingcart();

  ShoppingCart._shoppingcart();

  static createobject(){
    if(_cart==null)
    _cart=ShoppingCart._shoppingcart();
    return _cart;
  }
/*
-create method for check if item in cartItems
-change removeFromCart method body to Remove item 
-change addToCart method body to add new item 
-use Single Responsibility Principle
-make method in arrow method
 */
bool isfound(Item item)=>cartItems.contains(item);
bool removeFromCart(Item item) =>isfound(item)?cartItems.remove(item):false;
    
addToCart(Item item)=>!isfound(item)?cartItems.add(item):false;

int getCartItemsCount() => cartItems.length;
 
}
/*
-Create new class Invoice to implement (Single Responsibility Principle)
-Move createInvoice() method to Invoice class and make it a Constructor
-Move List item from Item class to Invoice class  with empty value 
-create print Invoice 
 */
class Invoice {
  double total=0.0;
  ShoppingCart? shopcart;
  Invoice({required this.shopcart});
  void calculatetotal( ) {
    for (var item in shopcart!.cartItems) {
      total += item.price;
    }
  }
    printInvoice() {
      shopcart!.cartItems.forEach((element) {
       print(element.printitem());
      });
  }
printtotal()=> calculatetotal();

   
  
}

/* 
-Create class ManageEmail and move sendemail() method inside managemail (use Single Responsibility Principle) 
 */
class ManageEmail {
  sendEmail(String customerEmail) {
    //Send Email to Customer
  }
}