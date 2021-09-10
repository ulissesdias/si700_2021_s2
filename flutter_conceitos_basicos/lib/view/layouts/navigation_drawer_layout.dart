import 'package:flutter/material.dart';
import 'package:flutter_conceitos_basicos/view/layouts/bottom_navigation_bar_layout.dart';
import 'package:flutter_conceitos_basicos/view/layouts/double_layout.dart';
import 'package:flutter_conceitos_basicos/view/layouts/tab_bar_layout.dart';
import 'package:flutter_conceitos_basicos/view/screens/first_screen.dart';

class MyNavigationDrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Navigation Drawer")),
      body: Center(child: Text("Navigation Drawer")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  "Letícia Lewartosky",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
            ListTile(
                leading: Icon(Icons.cake),
                title: Text("My Tab Bar Layout"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return MyTabBarLayout();
                  }));
                }),
            ListTile(
                leading: Icon(Icons.cake),
                title: Text("My Bottom Navigation Bar Layout"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MyBottomNavigationBarLayout()));
                }),
            ListTile(
                leading: Icon(Icons.cake),
                title: Text("My Double Layout"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MyDoubleLayout()));
                }),
          ],
        ),
      ),
    );
  }
}
