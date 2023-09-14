import '../mypackage/myfunction.dart';

String userview(){
  String msg='''
  ********Welcome to BookStore Application**************
  1. View Books
  2. Add Book
  3. Remove Book
  4. Search Books
  5. Add To Shopping Cart
  6. Manage Shopping Cart
  7. Confirm Payment
  8. Check Your Balance
  9. Get Details of One book
  q. Exit
  *********************************************''';
  String choice=input("$msg \n  Enter your choice: ");

  return choice;
  }


  