import 'package:banco_de_dados_local/data/local/local_database.dart';
import 'package:banco_de_dados_local/logic/monitor_local_db_event.dart';
import 'package:banco_de_dados_local/logic/monitor_local_db_state.dart';
import 'package:banco_de_dados_local/model/collection/note_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    add(AskNewList());
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      NoteCollection noteCollection =
          await DatabaseLocalServer.helper.getNoteList();
      yield MonitorState(noteCollection: noteCollection);
    }
  }
}
