import 'package:banco_de_dados_local_upgraded/model/note.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Note note;
  SubmitEvent({required this.note});
}

class DeleteEvent extends ManageEvent {
  int noteId;
  DeleteEvent({required this.noteId});
}

class UpdateRequest extends ManageEvent {
  int noteId;
  Note previousNote;
  UpdateRequest({required this.noteId, required this.previousNote});
}

class UpdateCancel extends ManageEvent {}
