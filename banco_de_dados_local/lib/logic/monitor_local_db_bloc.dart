import 'package:banco_de_dados_local/data/local/local_database.dart';
import 'package:banco_de_dados_local/logic/monitor_local_db_event.dart';
import 'package:banco_de_dados_local/logic/monitor_local_db_state.dart';
import 'package:banco_de_dados_local/model/collection/note_collection.dart';
import 'package:banco_de_dados_local/model/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection;

  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    add(AskNewList());
    DatabaseLocalServer.helper.stream.listen((event) {
      /*
       // Isso aqui funcionava quando havia o Invalidate
      if (event == DatabaseLocalServer.INVALIDATE) {
        // Todo: atualizar a lista por conta própria
        add(AskNewList());
      }
      */
      int noteId = event[0];
      Note note = event[1];
      if (note == null) {
        // Ocorreu um delete
        noteCollection.deleteNoteOfId(noteId);
      } else {
        noteCollection.updateOrInsertNoteOfId(noteId, note);
      }
      add(UpdateList());
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      noteCollection = await DatabaseLocalServer.helper.getNoteList();
      yield MonitorState(noteCollection: noteCollection);
    } else if (event is UpdateList) {
      yield MonitorState(noteCollection: noteCollection);
    }
  }
}
