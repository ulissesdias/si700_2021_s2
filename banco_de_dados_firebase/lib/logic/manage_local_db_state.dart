import 'package:banco_de_dados_firebase/model/note.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String noteId;
  Note previousNote;
  UpdateState({required this.noteId, required this.previousNote});
}
