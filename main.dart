import 'Doctor.dart';
import 'Patient.dart';
import 'bill.dart';

void main(List<String> args) {
 Doctor D1=Doctor(id: "2135", fname: "Ali", lname: "BenJahlan", specialty: "specialty 1"); 
//  Doctor D2=Doctor(id: "2136", fname: "Ali2", lname: "BenJahlan", specialty: "specialty 2"); 
//  Doctor D3=Doctor(id: "2137", fname: "Ali3", lname: "BenJahlan", specialty: "specialty 3"); 
//  Doctor D4=Doctor(id: "2138", fname: "Ali4", lname: "BenJahlan", specialty: "specialty 4"); 
 

 Patient p1=Patient(id: "hhckkc", fname: "Patient 1", lname: "lname", birthdate:"17/5/199" , physician: D1);
 Bill b1=Bill(doctorFees: 40.2, pharmacyChargesFees: 30.0);
 p1.addbill(b1);
 print(p1.Displayinfo());
 p1.bl.forEach((element) {
  print(element.toString());
 });
 print("total ${p1.total()}");
}


