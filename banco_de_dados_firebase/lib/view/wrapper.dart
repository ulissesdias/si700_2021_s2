import 'package:banco_de_dados_firebase/logic/manage_local_db_bloc.dart';
import 'package:banco_de_dados_firebase/logic/monitor_local_db_bloc.dart';
import 'package:banco_de_dados_firebase/view/screens/main_app.dart';
import 'package:banco_de_dados_firebase/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:banco_de_dados_firebase/logic/authentication/auth_bloc.dart';
import 'package:banco_de_dados_firebase/logic/authentication/auth_state.dart';

import 'package:banco_de_dados_firebase/view/screens/login_screen.dart';

class Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return MultiBlocProvider(providers: [
            BlocProvider(create: (_) => ManageLocalBloc()),
            BlocProvider(create: (_) => MonitorBloc())
          ], child: MainApp());
        } else {
          return //LoginScreen();

              DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    body: TabBarView(
                      children: [RegisterScreen(), LoginScreen()],
                    ),
                    appBar: AppBar(
                      title: const Text("Nikolas Dandrea"),
                      bottom: const TabBar(
                        tabs: [
                          Tab(text: "Novo Cadastro"),
                          Tab(text: "Efetuar Login")
                        ],
                      ),
                    ),
                  ));
        }
      },
    );
  }
}
