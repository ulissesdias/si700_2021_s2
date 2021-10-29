import 'package:banco_de_dados_webservice/data/local/remote_database.dart';
import 'package:banco_de_dados_webservice/logic/monitor_local_db_event.dart';
import 'package:banco_de_dados_webservice/logic/monitor_local_db_state.dart';
import 'package:banco_de_dados_webservice/model/collection/note_collection.dart';
import 'package:banco_de_dados_webservice/model/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    add(AskNewList());
    DatabaseRemoteServer.helper.stream.listen((event) {
      /*
       // Isso aqui funcionava quando havia o Invalidate
      if (event == DatabaseLocalServer.INVALIDATE) {
        // Todo: atualizar a lista por conta própria
        add(AskNewList());
      }
      */
      String noteId = event[0];

      if (event[1] == null) {
        // Ocorreu um delete
        noteCollection.deleteNoteOfId(noteId);
      } else {
        Note note = event[1];
        noteCollection.updateOrInsertNoteOfId(noteId, note);
      }
      add(UpdateList());
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      noteCollection = await DatabaseRemoteServer.helper.getNoteList();
      yield MonitorState(noteCollection: noteCollection);
    } else if (event is UpdateList) {
      yield MonitorState(noteCollection: noteCollection);
    }
  }
}
