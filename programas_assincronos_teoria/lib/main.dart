import 'package:flutter/material.dart';
import 'package:programas_assincronos_teoria/view/layout/tab_bar_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyTabBarLayout());
  }
}
