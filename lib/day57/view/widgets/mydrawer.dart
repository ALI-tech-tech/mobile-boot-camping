import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Admin',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Departments'),
            onTap: () {
              // Navigate to the home screen
              Navigator.of(context).pop(); // Close the drawer
              Navigator.pushReplacementNamed(context, '/departm');
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              // Navigate to the profile screen
              Navigator.of(context).pop(); // Close the drawer
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
          // Add more list tiles for additional navigation options
        ],
      ),
    );
  }
}