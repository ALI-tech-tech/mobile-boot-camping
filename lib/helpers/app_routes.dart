import 'package:blogappwithrealapi/core/view/add_artical.dart';
import 'package:flutter/material.dart';

import '../core/model/article.dart';
import '../core/view/article_detailsscreen.dart';
import '../core/view/home_screen.dart';
import '../core/view/login_screen.dart';
import '../core/view/register_screen.dart';
import '../error/views/404_error/not_found_error.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String errorNotfound = '/notfound';
  static const String addartical = '/addartical';
  static const String articaldetails = '/articaldetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case errorNotfound:
        return MaterialPageRoute(
          builder: (_) => NotFound404Error(),
        );
      case addartical:
        return MaterialPageRoute(
          builder: (_) => AddArticleView(),
        );
      case articaldetails:
      final article = settings.arguments as Article;
        return MaterialPageRoute(
          builder: (_) => ArticalDetailsScreen(article: article),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => NotFound404Error(),
        );
    }
  }
}
