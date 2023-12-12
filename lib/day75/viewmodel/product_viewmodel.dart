import 'dart:math';

import 'package:flutter_practis/day75/model/product.dart';
import 'package:get/get.dart';

class ProductViewModel extends GetxController {
  List<Product> allproducts = [];
  List<Product> selected = [];

  ProductViewModel() {
    getAll();
  }
  getAll() {
    allproducts = List.generate(
        30,
        (index) => Product(
            name: "Product ${index + 1}", price: Random().nextDouble() * 100));
  }

  addSelect(Product p) {
    if (selected.contains(p)) {
      selected.remove(p);
    } else {
      selected.add(p);
    }
    update();
  }

  updatee(Product p) {
    allproducts.forEach((element) {
      if (element.name == p.name) {
        element.isSelected.value = (!element.isSelected.value);
      }
    });
    update();
  }
}
