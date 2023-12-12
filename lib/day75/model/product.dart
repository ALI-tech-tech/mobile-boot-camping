// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class Product {
  String? name;
  double? price;
  RxBool isSelected=false.obs;
  Product({
    this.name,
    this.price,
    isSelected,
  })
  {
this.isSelected.value=false;
  }


}
