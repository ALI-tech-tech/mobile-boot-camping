import 'dart:math';


import 'suppliers.dart';

class Medicine {
  late String id;
  late String _name;
  late int unitPrice;
  late String category;
  late String expireDate;
  late Suppliers supplier;
  get getId => this.id;

 set setId( id) => this.id = id;

  get name => this._name;

 set name( value) => this._name = value;

  get getUnitPrice => this.unitPrice;

 set setUnitPrice( unitPrice) => this.unitPrice = unitPrice;

  get getCategory => this.category;

 set setCategory( category) => this.category = category;

  get getExpireDate => this.expireDate;

 set setExpireDate( expireDate) => this.expireDate = expireDate;

  get getSupplier => this.supplier;

 set setSupplier( supplier) => this.supplier = supplier;
  

  Medicine({required String name,required int unitprice,required String cat,required String expireDate ,required Suppliers sup }){
    this.id=Random().nextInt(1000).toString();
    this.category=cat;
    this._name=name;
    this.expireDate=expireDate;
    this.supplier=sup;
    this.unitPrice=unitprice;
  }
  display(){
    print("id ${this.id}, name :${_name}, unitPrice:${getUnitPrice}, category :${category}, expireDate :${expireDate}, supplier :${this.supplier.name}");
  }
}