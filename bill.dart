

import 'Person.dart';

class Bill  {
  late double _doctorFees;
  late double _pharmacyChargesFees;
  late double _roomRentFees;
  late double _discount;

  Bill({required double doctorFees,required double pharmacyChargesFees,double roomRentFees=0}){
    this._doctorFees=doctorFees;
    this._pharmacyChargesFees=pharmacyChargesFees;
    this._roomRentFees=roomRentFees;
  }
set Discount(double di)=>this._discount=di;

  getBillTotalAmount(){
    return (this._doctorFees+this._pharmacyChargesFees+this._roomRentFees) -
    ((this._doctorFees+this._pharmacyChargesFees+this._roomRentFees)*((this._discount)/100));
  }

  toString(){
    return "doctorFees : $_doctorFees \n pharmacyChargesFees : $_pharmacyChargesFees \n roomRentFees : $_roomRentFees \n discount: $_discount ";
  }
}