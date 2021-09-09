import 'package:flutter/material.dart';
import 'package:flutter_conceitos_basicos/view/screens/first_screen.dart';
import 'package:flutter_conceitos_basicos/view/screens/second_screen.dart';
import 'package:flutter_conceitos_basicos/view/screens/third_screen.dart';

class MyBottomNavigationBarLayout extends StatefulWidget {
  @override
  _MyBottomNavigationBarLayoutState createState() =>
      _MyBottomNavigationBarLayoutState();
}

class _MyBottomNavigationBarLayoutState
    extends State<MyBottomNavigationBarLayout> {
  int _currentPage = 0;
  List<Widget> _pages = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: _pages, index: _currentPage),
      appBar: AppBar(title: Text("Paloma Eduarda")),
      bottomNavigationBar: BottomNavigationBar(
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
