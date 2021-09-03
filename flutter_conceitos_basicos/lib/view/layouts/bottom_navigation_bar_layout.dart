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
  var _currentPage = 0;
  var _pages = [FirstScreen(), SecondScreen(), ThirdScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_currentPage]),
      appBar: AppBar(title: Text("asdf")),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cake), title: Text("asdf")),
          BottomNavigationBarItem(icon: Icon(Icons.cake), title: Text("asdf")),
          BottomNavigationBarItem(icon: Icon(Icons.cake), title: Text("asdf")),
        ],
      ),
    );
  }
}
