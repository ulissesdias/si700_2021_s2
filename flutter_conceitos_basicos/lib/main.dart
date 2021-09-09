import 'package:flutter/material.dart';
import 'package:flutter_conceitos_basicos/view/layouts/bottom_navigation_bar_layout.dart';
import 'package:flutter_conceitos_basicos/view/layouts/double_layout.dart';
import 'package:flutter_conceitos_basicos/view/layouts/tab_bar_layout.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "My First App", home: MyDoubleLayout()
        //MyBottomNavigationBarLayout()
        // MyTabBarLayout(),
        );
  }
}
