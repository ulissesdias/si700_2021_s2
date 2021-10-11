import 'package:banco_de_dados_local/logic/manage_local_db_bloc.dart';
import 'package:banco_de_dados_local/logic/manage_local_db_event.dart';
import 'package:banco_de_dados_local/logic/manage_local_db_state.dart';
import 'package:banco_de_dados_local/model/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesEntry extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey();
  final Note note = new Note();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerenciar Anotação")),
      body:
          BlocBuilder<ManageLocalBloc, ManageState>(builder: (context, state) {
        Note note;
        if (state is UpdateState) {
          note = state.previousNote;
        } else {
          note = new Note();
        }
        return Form(
            key: formKey,
            child: Column(
              children: [
                tituloFormField(note),
                descriptionFormField(note),
                submitButton(note, context, state),
                cancelButton(note, context, state),
              ],
            ));
      }),
    );
  }

  Widget tituloFormField(Note note) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.title,
        decoration: InputDecoration(
            labelText: "Título",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value.length == 0) {
            return "Adicione algum título";
          }
          return null;
        },
        onSaved: (value) {
          note.title = value;
        },
      ),
    );
  }

  Widget descriptionFormField(Note note) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.description,
        decoration: InputDecoration(
            labelText: "Anotação",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value.length == 0) {
            return "Adicione alguma anotação";
          }
          return null;
        },
        onSaved: (value) {
          note.description = value;
        },
      ),
    );
  }

  Widget submitButton(Note note, BuildContext context, ManageState state) {
    return ElevatedButton(
        child:
            (state is UpdateState ? Text("Update Data") : Text("Insert Data")),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            BlocProvider.of<ManageLocalBloc>(context)
                .add(SubmitEvent(note: note));
            formKey.currentState.reset();
            Navigator.pop(context);
          }
        });
  }

  Widget cancelButton(Note note, BuildContext context, ManageState state) {
    return (state is UpdateState
        ? ElevatedButton(
            onPressed: () {
              BlocProvider.of<ManageLocalBloc>(context).add(UpdateCancel());
              Navigator.pop(context);
            },
            child: Text("Cancel Update"))
        : Container());
  }
}
