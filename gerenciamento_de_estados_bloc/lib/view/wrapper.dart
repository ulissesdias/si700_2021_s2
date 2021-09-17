import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_state.dart';
import 'package:gerenciamento_de_estados_bloc/view/screens/counter_screen.dart';
import 'package:gerenciamento_de_estados_bloc/view/screens/login_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return CounterScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
