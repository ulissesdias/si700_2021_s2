import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/authentication/auth_event.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
