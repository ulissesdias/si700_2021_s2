import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/counter/counter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/radio_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/slider_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/switch_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/view/wrapper.dart';

import 'logic/form_widgets/checkbox_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        /*home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(), child: LoginScreen()),*/
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(
              create: (context) => CheckBoxBloc(CheckBoxState.unchecked)),
          BlocProvider(create: (context) => SwitchBloc(SwitchState.off)),
          BlocProvider(create: (context) => SliderBloc(5)),
          BlocProvider(
            create: (context) => RadioBloc(3),
          )
        ], child: Wrapper()));
  }
}
