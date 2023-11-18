import 'package:flutter/material.dart';
import 'package:flutter_practis/restructureproject/core/models/product.dart';

import '../../helper/database_manager.dart';
import 'products_repo.dart';

class LocalProductsRepo extends ProductsRepo {

  DBManger dbManger = DBManger();


  @override
  Future<List<dynamic>> getProducts() async {
    
    return await dbManger.fetch("select * from products");
  }

  @override
  storeProduct(String source, data) {
    Product p = data as Product;
    
    Map<String, dynamic> prodcutRow = p.toJson();
    List<Map<String, dynamic>> sub_images = [];
    p.images!.forEach((element) {
      Map<String, dynamic> img = Map();
      img[DBManger.COL_IMAGE] = element;
      sub_images.add(img);
    });
    prodcutRow.remove("images");
    return dbManger.insert(source, prodcutRow,
        foreignTable: DBManger.TBL_IMAGES,foreignkey: DBManger.COL_PRODUCT_ID, sub_rows: sub_images);
  }
}
