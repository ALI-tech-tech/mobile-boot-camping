import 'package:flutter_practis/day49/core/API.dart';
import 'package:flutter_practis/day49/core/AppURLConstant.dart';
import 'package:flutter_practis/day49/features/model/Product.dart';

class ViewModelProduct {
  APIMethods api=APIMethods();

  Future<List?> getCategries() async{
    List<dynamic>? li= await api.getData(apiUrl:CATEGORY );
    print(li);
    return li;
  }

  Future<List<Product>?> getProdutc(String category) async{
    List<dynamic>? li= await api.getData(apiUrl:"${CATEGORYSP}/$category" );

    print(li);
    return List.generate(li!.length, (index) => Product.fromJson(li[index]));
  }
}