import 'package:flutter/material.dart';

import 'route_manager.dart';

void main(){
  runApp(StoreEntry());
}

class StoreEntry extends StatelessWidget {
  const StoreEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      //initialRoute: '/listproduct',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
