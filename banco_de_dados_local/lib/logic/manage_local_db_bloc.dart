import 'package:banco_de_dados_local/data/local/local_database.dart';
import 'package:banco_de_dados_local/logic/manage_local_db_event.dart';
import 'package:banco_de_dados_local/logic/manage_local_db_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageLocalBloc extends Bloc<ManageEvent, ManageState> {
  ManageLocalBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is SubmitEvent) {
      if (state is InsertState) {
        DatabaseLocalServer.helper.insertNote(event.note);
        yield InsertState();
      }
    }
  }
}
