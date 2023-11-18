import 'package:flutter_practis/restructureproject/core/models/product.dart';
import 'package:flutter_practis/restructureproject/core/repositories/products_repo.dart';
import 'package:flutter_practis/restructureproject/helper/database_manager.dart';

class ProductViewModel {
  List<Product> _allProducts = [];

  Future<List<Product>> fetchProducts(ProductsRepo productsRepo) async {
    List<dynamic> products = await productsRepo.getProducts();
    print(products);
    try {
      _allProducts = products.map((e) => Product.fromJson(e)).toList();
    } catch (ex) {
      print("the exception is $ex");
    }
    return _allProducts;
  }

  Future<int> addProduct(ProductsRepo productsRepo, Product p) async {
    return await productsRepo.storeProduct(DBManger.TBL_PRODUCTS, p);
  }
}
