import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_event.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/checkbox_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/radio_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/slider_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/switch_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = new GlobalKey();
    String username;
    String password;
    return Scaffold(
      appBar: AppBar(title: Text("Cícero Roberto")),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              validator: (String inValue) {
                if (inValue.length == 0) {
                  return "Insira algo como username";
                }
                return null;
              },
              onSaved: (String inValue) {
                username = inValue;
              },
            ),
            TextFormField(
              validator: (String inValue) {
                if (inValue.length < 4) {
                  return "Tem que ter ao menos 4 caracters";
                }
                return null;
              },
              onSaved: (String inValue) {
                password = inValue;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState.validate()) {
                  formkey.currentState.save();
                  // Lançando evento
                  BlocProvider.of<AuthBloc>(context)
                      .add(LoginUser(username: username, password: password));
                }
              },
              child: Text("Submit"),
            ),
            Divider(),
            receptoresEvents(),
          ],
        ),
      ),
    );
  }

  Widget receptoresEvents() {
    return Row(
      children: [
        BlocBuilder<CheckBoxBloc, CheckBoxState>(
            builder: (context, state) => state == CheckBoxState.checked
                ? Icon(Icons.radio_button_checked)
                : Icon(Icons.radio_button_unchecked)),
        BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) => state == SwitchState.on
                ? Icon(Icons.turned_in)
                : Icon(Icons.turned_in_not)),
        BlocBuilder<SliderBloc, double>(
            builder: (context, state) => Text("${state.toInt()}  ")),
        BlocBuilder<RadioBloc, int>(
            builder: (context, state) => Text("$state  "))
      ],
    );
  }
}
