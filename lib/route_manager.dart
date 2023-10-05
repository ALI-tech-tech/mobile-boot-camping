import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/homeScreen.dart';
import 'package:store_app/mychanges/listproduct.dart';
import 'package:store_app/page_not_found.dart';
import 'package:store_app/productModel.dart';
import 'package:store_app/product_details.dart';
import 'package:store_app/splash_screen.dart';
import 'package:store_app/twotap/allproduct.dart';

import 'mychanges/details.dart';
import 'twotap/Details2.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (ctx) {
            return SplashScreen();
          });
        }
      case '/home':
        {
          return MaterialPageRoute(builder: (ctx) {
            return HomeScreen();
          });
        }
      case '/listproduct':
        {
          return MaterialPageRoute(builder: (ctx) {
            return ListProduct();
          });
        }

      case '/details':
        {
          ProductModel product = settings.arguments as ProductModel;
          return MaterialPageRoute(builder: (ctx) {
            return Details(
              pm:  product,
            );
          });
        }
         case '/details2':
        {
          List< ProductModel> product = settings.arguments as List< ProductModel> ;
          return MaterialPageRoute(builder: (ctx) {
            return Details2(
              li:   product,
            );
          });
        }
        case '/allproduct':
        {
          return MaterialPageRoute(builder: (ctx) {
            return AllProduct();
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
