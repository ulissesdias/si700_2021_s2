import 'package:banco_de_dados_firebase/logic/manage_local_db_bloc.dart';
import 'package:banco_de_dados_firebase/logic/manage_local_db_event.dart';
import 'package:banco_de_dados_firebase/view/screens/note_list.dart';
import 'package:banco_de_dados_firebase/view/screens/notes_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatefulWidget {
  @override
  _ScaffoldAppState createState() => _ScaffoldAppState();
}

class _ScaffoldAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ManageLocalBloc>(context).add(UpdateCancel());
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => NotesEntry()));
        },
        child: const Icon(Icons.add),
      ),
      body: NoteList(),
    );
  }
}
