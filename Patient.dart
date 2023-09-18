import 'Doctor.dart';
import 'Person.dart';
import 'bill.dart';

class Patient extends Person {
  late String _birthdate;
  late Doctor _physician;
  late List<Bill> bl=[];

  Patient({required String id ,required String fname,required String lname ,required String birthdate ,required Doctor physician}):super( fname: fname,lname: lname){
    this.setID=setId(id);
    this._physician=physician;
    this._birthdate=birthdate;
  }
  
  String setId(String id){
    return (id.length==6)?id.toUpperCase():"Enter coreect ID";
    }
  Displayinfo(){
    
    return "${super.Displayinfo()} ,birthdate= ${this._birthdate} ,physician=${this._physician.Displayinfo()} ";
  }

  addbill(Bill b){ 
    if ((DateTime.now().year - int.parse(_birthdate.split("/")[0]))>50) {
      b.Discount=30;
    }
    bl.add(b);
  }

  total(){
    double total=0;
    for (var i = 0; i < bl.length; i++) {
      total+=bl[i].getBillTotalAmount();
    }

    return total;
  }
}