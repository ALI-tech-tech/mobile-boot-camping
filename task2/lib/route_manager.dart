import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/Cart.dart';

import 'homeScreen.dart';
import 'page_not_found.dart';
import 'productModel.dart';
import 'product_details.dart';



class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   {
      //     return MaterialPageRoute(builder: (ctx) {
      //       return SplashScreen();
      //     });
      //   }
      case '/home':
        {
          return MaterialPageRoute(builder: (ctx) {
            return HomeScreen();
          });
        }
    

      case '/details':
        {
          ProductModel product = settings.arguments as ProductModel;
          return MaterialPageRoute(builder: (ctx) {
            return ProductDetails(
              product:   product,
            );
          });
        }
        case "/cart":
        {
          List<ProductModel> product = settings.arguments as List<ProductModel>;
          return MaterialPageRoute(builder: (ctx) {
            return Cart(
              products: product,
            );
          });
        }
        case "/notfound":
        {
          return MaterialPageRoute(builder: (ctx) {
            return PageNotFound();
          });
        }
       
       
      default:
        {
          return MaterialPageRoute(builder: (ctx) {
            return PageNotFound();
          });
        }
    }
  }
}
