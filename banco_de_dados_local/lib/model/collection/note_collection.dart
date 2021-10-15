import '../note.dart';

class NoteCollection {
  List<int> idList;
  List<Note> noteList;

  NoteCollection() {
    idList = [];
    noteList = [];
  }

  int length() {
    return idList.length;
  }

  Note getNodeAtIndex(int index) {
    return noteList[index];
  }

  int getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(int id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertNoteOfId(int id, Note note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] = note;
    } else {
      idList.add(id);
      noteList.add(note);
    }
  }

  updateNoteOfId(int id, Note note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] = note;
    }
  }

  deleteNoteOfId(int id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertNoteOfId(int id, Note note) {
    idList.add(id);
    noteList.add(note);
  }
}
