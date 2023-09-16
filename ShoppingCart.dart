import 'mypackage/myfunction.dart';

void main(List<String> args) {
  Book b1 = Book(450, "Book 1", "Mike X", 2, 30.5, ["Science", "Development"]);
  Book b2 = Book(451, "Book 2", "Jad Y", 0, 47.5, ["Horror", "Crime"]);
  Book b3 = Book(452, "Book 3", "Michel Z", 4, 17, ["Horror", "Comic"]);
  List<Book> allbookk = [b1, b2, b3];
  ShoppingCart mycart = ShoppingCart();
  String operation = "";
  do {
    print('''
1-view books,
2-Add to card ,
3-remove from cart,
4-View my cart items
5- total''');
    operation = input("your choose : ");
    switch (operation) {
      case '1':
        allbookk.forEach((element) {
          String msg = (element.Quantity == 0 ? "Sold Out" : "Available");
          String book = '''
[${element.name}](${element.id}) -- Author :${element.Author}, Quantity :${element.Quantity}, Price :${element.Price}, Category :${element.Category}, status :$msg''';
          print(book);
        });

        break;
      case '2':
        String book = input("Enter book name to add : ");
        allbookk.forEach((element) {
          if (element.name.contains(book)) {
            if (!mycart.items.contains(element)) {
              mycart.addtocart(element);  
            }else{
              print("The book ${element.name} is in your cart before");
            }
            
          }
        });
        
        break;
      case '3':
        String bo = input("Enter book name to remove : ");
        mycart.items.forEach((element) {
          if (element.name.contains(bo)) {
            mycart.remove(element);
          }
        });
        print("Remove done");
        break;
      case '4':
      mycart.items.forEach((element) {
        String msg = (element.Quantity == 0 ? "Sold Out" : "Available");
          String book = '''
[${element.name}](${element.id}) -- Author :${element.Author}, Quantity :${element.Quantity}, Price :${element.Price}, Category :${element.Category}, status :$msg''';
          print(book);
      });
      break;

      case '5':
      print(mycart.totalcost());
      break;
      case 'q':
        print("good by");
        break;
      default:
    }
  } while (operation != 'q');
}

class ShoppingCart {
  List<Book> items = [];
  double total = 0;

  addtocart(Book b) {
    if (b.Quantity != 0){
      items.add(b);
      print("Add done");
}    else {
      print("Not available");
    }
  }

  totalcost() {
    if (items.length>0) {
      items.forEach((element) {
      total += element.Price;
    });
    }
    return total==0?"no book found ":total;
  }

  remove(Book b) {
    if (items.contains(b)) {
      items.remove(b);
    } else {
      print("${b.name} ==> not in your cart");
    }
  }
}

class Book {
  late int id;
  late String name;
  late String Author;
  late double Quantity;
  late double Price;
  late List<String> Category;

  Book(int id, String name, String Auth, double Qty, double price,
      List<String> Cate) {
    this.id = id;
    this.name = name;
    this.Author = Auth;
    this.Category = Cate;
    this.Price = price;
    this.Quantity = Qty;
  }
}
