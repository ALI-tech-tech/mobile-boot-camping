
import 'dart:math';
import 'Invoice.dart';
import 'Medicines.dart';
import 'client.dart';
import 'invoice_details.dart';
import 'pharmacist.dart';
import 'saerch.dart';
import 'suppliers.dart';

void main(List<String> args) {
  Search search=Search<Medicine>();
  List<Suppliers>sups=List.generate(5, (index) => Suppliers(name: "Suplier${index}", mobile: "77${genratenum()}", company: "Company ${index}"));
  List<Client> clints=List.generate(5, (index) => Client(name: "Client ${index}", mobile: "77${genratenum()}", address: "address ${index}", BirthDate: "${Random().nextInt(30)}/${Random().nextInt(12)}/${Random().nextInt(2023)}"));
  List<Pharmacist> pharm=List.generate(5, (index) => Pharmacist(name: "Pharmacist ${index}", mobile: "77${genratenum()}",salsry: Random().nextInt(10000)));
  List<Medicine> medicines=List.generate(5, (index) => Medicine(name: "Medicine ${index}", unitprice: Random().nextInt(5000), cat: "Category ${index}", expireDate: "${Random().nextInt(30)}/${Random().nextInt(12)}/${Random().nextInt(2023)}", sup: sups[index]));
  Invoice iv=Invoice();
  Invoicedetails invdt=Invoicedetails(md2: medicines[0], Qty: 3);
  Invoicedetails invdt2=Invoicedetails(md2: medicines[1], Qty: 1);
  Invoicedetails invdt3=Invoicedetails(md2: medicines[2], Qty: 8);
  Invoicedetails invdt4=Invoicedetails(md2: medicines[3], Qty: 5);
  iv.invoDetail.addAll([invdt,invdt2,invdt3,invdt4]);
  clints[0].invoices.add(iv);
  print("---------------------Sup-------------------");
  sups.forEach((element) {
    element.displayinfo();
  });
  print("---------------------client-------------------");
  clints.forEach((element) {
    element.displayinfo();
  });
  print("---------------------pharm-------------------");
  pharm.forEach((element) {
    element.displayinfo();
  });
  print("---------------------medicine-------------------");
  medicines.forEach((element) {
    element.display();
  });
  print("---------------------invoice-------------------");
iv.invoDetail.forEach((element) {
    element.printInvoiceDetails();
  });
  print("--------------------->4000-------------------");
 search.search(medicines, 4000 ,operatorT: ">");
 print("---------------------category 4-------------------");
 search.search(medicines, "category 4",operatorT: "==");
  print("---------------------Search for Medicines that contains 4 in their name-------------------");
search.search(medicines, "4") ;
 print("---------------------Search for invoices for client 1 and with 1Medicine 1 name-------------------");
search.search(clints, "client 1",operatorT: "Medicine 1");
 print("---------------------Get the first 3 medicines with expire date after 2000-------------------");
search.search(medicines, 2000);



}





genratenum(){
    var rndnumber="";
  var rnd= new Random();
  for (var i = 0; i < 6; i++) {
  rndnumber = rndnumber + rnd.nextInt(9).toString();
  }
  return rndnumber;
  }