import 'package:banco_de_dados_firebase/data/cloud/firestore_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manage_local_db_event.dart';
import 'manage_local_db_state.dart';

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
          FirebaseRemoteServer.helper.insertNote(event.note);
        } else if (state is UpdateState) {
          FirebaseRemoteServer.helper
              .updateNote((state as UpdateState).noteId, event.note);
        }
      } else if (event is DeleteEvent) {
        FirebaseRemoteServer.helper.deleteNote(event.noteId);
      }
    }
  }
}
