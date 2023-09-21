
import 'Invoice.dart';
import 'Medicines.dart';
import 'client.dart';
import 'invoice_details.dart';

class Search<T> {
  
  search(List<T> list,dynamic keyword,{String? operatorT}){
    if (T.runtimeType.toString()=="Medicine" && keyword.runtimeType.toString() == "double" && operatorT==">") {
      list.forEach((element ) {
        if ((element as Medicine).getUnitPrice>keyword) {
          (element as Medicine).display();
        }
      });
    }else if(T==Medicine && keyword is String && operatorT=="==") {
      list.forEach((element ) {
        if ((element as Medicine).category==keyword) {
          (element as Medicine).display();
        }
      });
    }else if(T==Medicine && keyword is String && keyword.length==1&& operatorT==null) {
      list.forEach((element ) {
        if ((element as Medicine).name.toString().contains(keyword)) {
          (element as Medicine).display();
        }
      });}
    if(T is Client && keyword is String && operatorT is String){
      list.forEach((element) {
        if((element as Client).name==keyword ){
          (element as Client).invoices.forEach((element) {
            if((element.invoDetail as Invoicedetails).md.name==operatorT){
             (element.invoDetail as Invoicedetails).printInvoiceDetails();
            }
           });
        }
      });
    }
    if (T is Medicine && keyword is int) {
      List<Medicine> li=[];
      list.forEach((element) {
        List<String> date=(element as Medicine).expireDate.split("/");
        if(int.parse( date[2])>keyword){
          if (li.length<3)
          li.add(element);
        }
      });

      li.forEach((element) { 
        element.display();
      });
    }



  }
  
}