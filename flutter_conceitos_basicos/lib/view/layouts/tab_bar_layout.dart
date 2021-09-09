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
                Tab(child: Text("Primeira"), icon: Icon(Icons.cake)),
                Tab(child: Text("Segunda"), icon: Icon(Icons.cloud)),
                Tab(child: Text("Terceira"), icon: Icon(Icons.close)),
              ],
            ),
          ),
          body: TabBarView(children: [
            FirstScreen(),
            //Text("Lewartosky"),
            SecondScreen(),
            ThirdScreen(),
          ])),
    );
  }
}
