import 'package:flutter/material.dart';
import 'package:programas_assincronos_teoria/view/screens/isolates_async.dart';
import 'package:programas_assincronos_teoria/view/screens/promises_async.dart';
import 'package:programas_assincronos_teoria/view/screens/streams_async_star.dart';

class MyTabBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Programas Assíncronos"),
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Promises"), icon: Icon(Icons.cake)),
                Tab(child: Text("Isolates"), icon: Icon(Icons.cloud)),
                Tab(child: Text("Streams"), icon: Icon(Icons.close)),
              ],
            ),
          ),
          body: TabBarView(children: [
            PromisesAsync(),
            IsolatesAsync(),
            StreamsAsyncStar(),
          ])),
    );
  }
}
