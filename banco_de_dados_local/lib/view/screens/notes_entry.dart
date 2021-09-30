import 'package:banco_de_dados_local/model/note.dart';
import 'package:flutter/material.dart';

class NotesEntry extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey();
  final Note note = new Note();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            tituloFormField(note),
            descriptionFormField(note),
            submitButton(note, context),
            cancelButton(note, context),
          ],
        ));
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

  Widget submitButton(Note note, context) {
    return ElevatedButton(child: Text("Insert Data"), onPressed: () {});
  }

  Widget cancelButton(Note note, context) {
    return ElevatedButton(onPressed: () {}, child: Text("Cancel Update"));
  }
}
