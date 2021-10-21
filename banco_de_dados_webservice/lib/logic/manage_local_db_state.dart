import 'package:banco_de_dados_webservice/model/note.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  int noteId;
  Note previousNote;
  UpdateState({required this.noteId, required this.previousNote});
}
