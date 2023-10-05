import 'package:flutter/material.dart';
import 'package:store_app/route_manager.dart';

void main(){
  runApp(StoreEntry());
}

class StoreEntry extends StatelessWidget {
  const StoreEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/allproduct',
      //initialRoute: '/listproduct',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
