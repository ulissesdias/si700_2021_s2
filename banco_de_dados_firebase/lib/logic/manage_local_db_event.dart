import 'package:banco_de_dados_firebase/model/note.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Note note;
  SubmitEvent({required this.note});
}

class DeleteEvent extends ManageEvent {
  String noteId;
  DeleteEvent({required this.noteId});
}

class UpdateRequest extends ManageEvent {
  String noteId;
  Note previousNote;
  UpdateRequest({required this.noteId, required this.previousNote});
}

class UpdateCancel extends ManageEvent {}
