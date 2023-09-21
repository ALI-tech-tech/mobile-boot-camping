import 'Medicines.dart';

class Invoicedetails {
  late int Quantity;
  late Medicine md;
  late double total;
  
  

  Invoicedetails({required Medicine md2 ,required int Qty}){
    this.Quantity=Qty;
    this.md=md2;
    this.total=(Qty*md2.unitPrice).toDouble();
  }

  printInvoiceDetails(){
    print("Quantity : ${this.Quantity}, Price : ${this.md.unitPrice},Medicine Name:${this.md.name}, total ${this.total}");
  }
}