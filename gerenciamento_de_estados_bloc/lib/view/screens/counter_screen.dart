import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_event.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_state.dart';
import 'package:gerenciamento_de_estados_bloc/logic/counter/counter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/counter/counter_state.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is Authenticated) {
            return Text("${state.nome}");
          } else {
            return Text("Estranho");
          }
        }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                '${state.counterValue}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CounterEvent.decrement);
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CounterEvent.increment);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(Logout());
            },
            tooltip: 'Increment',
            child: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
