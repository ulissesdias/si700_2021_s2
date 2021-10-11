import 'package:banco_de_dados_local/logic/manage_local_db_event.dart';
import 'package:banco_de_dados_local/logic/monitor_local_db_bloc.dart';
import 'package:banco_de_dados_local/view/screens/note_list.dart';
import 'package:banco_de_dados_local/view/screens/notes_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/manage_local_db_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ManageLocalBloc()),
          BlocProvider(create: (_) => MonitorBloc())
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ScaffoldApp()));
  }
}

class ScaffoldApp extends StatefulWidget {
  @override
  _ScaffoldAppState createState() => _ScaffoldAppState();
}

class _ScaffoldAppState extends State<ScaffoldApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ManageLocalBloc>(context).add(UpdateCancel());
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => NotesEntry()));
        },
        child: Icon(Icons.add),
      ),
      body: NoteList(),
    );
  }
}
