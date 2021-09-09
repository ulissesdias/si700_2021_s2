import 'package:flutter/material.dart';
import 'package:flutter_conceitos_basicos/view/layouts/tab_bar_layout.dart';
import 'package:flutter_conceitos_basicos/view/screens/first_screen.dart';
import 'package:flutter_conceitos_basicos/view/screens/second_screen.dart';
import 'package:flutter_conceitos_basicos/view/screens/third_screen.dart';

class MyDoubleLayout extends StatefulWidget {
  @override
  _MyDoubleLayoutState createState() => _MyDoubleLayoutState();
}

class _MyDoubleLayoutState extends State<MyDoubleLayout> {
  int _currentPage = 0;
  List<Widget> _pages = [
    MyTabBarDoubleLayout("Letícia", "Breno", "Samantha"),
    MyTabBarDoubleLayout("Paloma", "Carlos", "Victor"),
    MyTabBarDoubleLayout("Isaque", "Nícolas", "Cícero"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: _pages, index: _currentPage),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: _currentPage,
        onTap: (int novoIndex) {
          setState(() {
            _currentPage = novoIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Primeira"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms_rounded), label: "Segunda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Terceira"),
        ],
      ),
    );
  }
}

class MyTabBarDoubleLayout extends StatelessWidget {
  final String n1;
  final String n2;
  final String n3;
  MyTabBarDoubleLayout(this.n1, this.n2, this.n3);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Julia Nakamura"),
            bottom: TabBar(
              tabs: [
                Tab(child: Text("$n1"), icon: Icon(Icons.cake)),
                Tab(child: Text("$n2"), icon: Icon(Icons.cloud)),
                Tab(child: Text("$n3"), icon: Icon(Icons.close)),
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
