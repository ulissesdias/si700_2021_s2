import 'package:banco_de_dados_firebase/data/cloud/firestore_database.dart';
import 'package:banco_de_dados_firebase/logic/monitor_local_db_event.dart';
import 'package:banco_de_dados_firebase/logic/monitor_local_db_state.dart';
import 'package:banco_de_dados_firebase/model/collection/note_collection.dart';
import 'package:banco_de_dados_firebase/model/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    add(AskNewList());
    FirebaseRemoteServer.helper.stream.listen((event) {
      /*
       // Isso aqui funcionava quando havia o Invalidate
      if (event == DatabaseLocalServer.INVALIDATE) {
        // Todo: atualizar a lista por conta própria
        add(AskNewList());
      }
      */

      /*
      String noteId = event[0];

      if (event[1] == null) {
        // Ocorreu um delete
        noteCollection.deleteNoteOfId(noteId);
      } else {
        Note note = event[1];
        noteCollection.updateOrInsertNoteOfId(noteId, note);
      }
      */
      noteCollection = event;

      add(UpdateList());
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      noteCollection = await FirebaseRemoteServer.helper.getNoteList();
      yield MonitorState(noteCollection: noteCollection);
    } else if (event is UpdateList) {
      yield MonitorState(noteCollection: noteCollection);
    }
  }
}
