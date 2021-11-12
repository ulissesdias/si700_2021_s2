import 'package:banco_de_dados_firebase/logic/manage_local_db_bloc.dart';
import 'package:banco_de_dados_firebase/logic/manage_local_db_event.dart';
import 'package:banco_de_dados_firebase/logic/monitor_local_db_bloc.dart';
import 'package:banco_de_dados_firebase/logic/monitor_local_db_state.dart';
import 'package:banco_de_dados_firebase/model/collection/note_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notes_entry.dart';

class NoteList extends StatelessWidget {
  final List colors = [Colors.orange, Colors.red, Colors.yellow];
  final List icons = [Icons.ac_unit_outlined, Icons.access_alarm_rounded];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista do Banco de Dados")),
      body: BlocBuilder<MonitorBloc, MonitorState>(
        builder: (context, state) => getNoteListView(state.noteCollection),
      ),
    );
  }

  ListView getNoteListView(NoteCollection noteCollection) {
    return ListView.builder(
        itemCount: noteCollection.length(),
        itemBuilder: (context, position) => ListTile(
              onTap: () {
                BlocProvider.of<ManageLocalBloc>(context).add(UpdateRequest(
                    noteId: noteCollection.getIdAtIndex(position),
                    previousNote: noteCollection.getNodeAtIndex(position)));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider<ManageLocalBloc>.value(
                            value: BlocProvider.of<ManageLocalBloc>(context),
                            child: NotesEntry())));
              },
              leading: Icon(icons[position % icons.length]),
              trailing: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ManageLocalBloc>(context).add(DeleteEvent(
                        noteId: noteCollection.getIdAtIndex(position)));

                    // BlocProvider.of<MonitorBloc>(context).add(AskNewList());
                  },
                  child: const Icon(Icons.delete)),
              title: Text(noteCollection.getNodeAtIndex(position).title),
              subtitle:
                  Text(noteCollection.getNodeAtIndex(position).description),
            ));
  }
}
