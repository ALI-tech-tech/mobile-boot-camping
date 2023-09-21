import 'Medicines.dart';
import 'invoice_details.dart';

class Invoice {
  late List<Invoicedetails> invoDetail=[];
  late double totalinvoce;
  late double discount;
 List<Invoicedetails> get getInvoDetail => this.invoDetail;

 set setInvoDetail( invoDetail) { 
  this.invoDetail.add(invoDetail) ;
  claculatetotal();
 }
  Invoice(){
   
  }
claculatetotal(){
  double sum=0;
    for (var i = 0; i < invoDetail.length; i++) {
      sum+=invoDetail[i].total;
    }
    this.totalinvoce=sum;
    calcodiscount();
}

calcodiscount(){
  if (totalinvoce>5000 && invoDetail.length>=4) {
    this.discount=totalinvoce*(20/100);
    totalinvoce=totalinvoce-(discount);
  }
}

printinvoicedetail(){
  invoDetail.forEach((element) {
    print("${element.printInvoiceDetails()}");
  });
  print("Discount :${discount}");
  print("Final Total Amount :${this.claculatetotal()}");
}
}