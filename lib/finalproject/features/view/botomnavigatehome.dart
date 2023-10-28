import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/features/view/moviepage.dart';

import 'package:flutter_practis/finalproject/features/view/notifications.dart';
import 'package:flutter_practis/finalproject/features/view/watchlist.dart';

/// Flutter code sample for [BottomNavigationBar].

// class BottomNavigationBarApp extends StatelessWidget {
//   static String rout="/Homemoviepage";
//   const BottomNavigationBarApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: BottomNavigationBarApp(),
//     );
//   }
// }

class BottomNavigationBarApp extends StatefulWidget {
  static String rout = "/Homemoviepage";
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    WatchList(),
    MovieHomepage(),
    Notificationmi()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
