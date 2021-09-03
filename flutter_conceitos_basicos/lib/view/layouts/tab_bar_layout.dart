import 'package:flutter/material.dart';
import 'package:flutter_conceitos_basicos/view/screens/first_screen.dart';
import 'package:flutter_conceitos_basicos/view/screens/second_screen.dart';
import 'package:flutter_conceitos_basicos/view/screens/third_screen.dart';

class MyTabBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Julia Nakamura"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cake)),
                Tab(icon: Icon(Icons.cloud)),
                Tab(icon: Icon(Icons.close)),
              ],
            ),
          ),
          body: TabBarView(children: [
            FirstScreen(),
            SecondScreen(),
            ThirdScreen(),
          ])),
    );
  }
}
