import 'package:banco_de_dados_local/data/local/local_database.dart';
import 'package:banco_de_dados_local/logic/manage_local_db_event.dart';
import 'package:banco_de_dados_local/logic/manage_local_db_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageLocalBloc extends Bloc<ManageEvent, ManageState> {
  ManageLocalBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is UpdateRequest) {
      yield UpdateState(noteId: event.noteId, previousNote: event.previousNote);
    } else if (event is UpdateCancel) {
      yield InsertState();
    } else {
      if (event is SubmitEvent) {
        if (state is InsertState) {
          DatabaseLocalServer.helper.insertNote(event.note);
        } else if (state is UpdateState) {
          UpdateState updateState = state;
          DatabaseLocalServer.helper.updateNote(updateState.noteId, event.note);
        }
      } else if (event is DeleteEvent) {
        DatabaseLocalServer.helper.deleteNote(event.noteId);
      }
    }
  }
}
