import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_state.dart';
import 'package:gerenciamento_de_estados_bloc/view/screens/counter_screen.dart';
import 'package:gerenciamento_de_estados_bloc/view/screens/login_screen.dart';
import 'package:gerenciamento_de_estados_bloc/view/screens/widgets_bloc_manager.dart';
import 'package:gerenciamento_de_estados_bloc/view/screens/widgets_stateful_manager.dart';

class Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  var _currentPage = 0;
  var _pages = [CounterScreen(), WidgetsStateful(), WidgetsBloc()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
              body: _pages[_currentPage],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentPage,
                onTap: (int novoIndex) {
                  setState(() {
                    _currentPage = novoIndex;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.ac_unit_outlined), label: "Counter"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.ac_unit_outlined),
                      label: "StatefulWidget"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.ac_unit_outlined), label: "Bloc")
                ],
              ));
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
