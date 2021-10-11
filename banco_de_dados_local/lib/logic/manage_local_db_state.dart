import 'package:banco_de_dados_local/model/note.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  int noteId;
  Note previousNote;
  UpdateState({this.noteId, this.previousNote});
}
