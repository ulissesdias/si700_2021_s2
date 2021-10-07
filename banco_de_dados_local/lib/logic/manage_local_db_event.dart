import 'package:banco_de_dados_local/model/note.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Note note;
  SubmitEvent({this.note});
}
