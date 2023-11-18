
import 'package:dio/dio.dart';

import '../../constants/api_url.dart';
import 'products_repo.dart';
class OnlineProductsRepo extends ProductsRepo{
  Dio d=Dio();
  @override
 Future<List<dynamic>> getProducts() async{
      Response serverResponse=await d.get(API_URL.PRODUCTS);
      return serverResponse.data["products"];
  }

  @override
  storeProduct(String source, data) {

  }





}