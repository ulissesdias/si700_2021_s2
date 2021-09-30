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
            PromisesAsync(),
            IsolatesAsync(),
            StreamsAsyncStar(),
          ])),
    );
  }
}
