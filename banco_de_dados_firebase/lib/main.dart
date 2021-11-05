import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:banco_de_dados_firebase/logic/authentication/auth_bloc.dart';
import 'package:banco_de_dados_firebase/view/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          BlocProvider(create: (context) => AuthBloc()),
        ], child: Wrapper()));
  }
}
