// Data Provider para o banco de dados local sqflite

import 'dart:async';

import 'package:banco_de_dados_firebase/model/collection/note_collection.dart';
import 'package:banco_de_dados_firebase/model/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRemoteServer {
  // Atributo que irá afunilar todas as consultas
  static FirebaseRemoteServer helper = FirebaseRemoteServer._createInstance();

  // Construtor privado
  FirebaseRemoteServer._createInstance();

  String? uid;
  final CollectionReference noteCollection =
      FirebaseFirestore.instance.collection("notes");

  updateUserData(String nome, String sobrenome, int idade) async {
    await noteCollection
        .doc(uid)
        .set({'nome': nome, 'sobrenome': sobrenome, 'idade': idade});
  }

  Future<Note> getNote(noteId) async {
    DocumentSnapshot doc =
        await noteCollection.doc(uid).collection("my_notes").doc(noteId).get();
    Note note = Note.fromMap(doc.data());
    return note;
  }

  Future<int> insertNote(Note note) async {
    await noteCollection
        .doc(uid)
        .collection("my_notes")
        .add({"title": note.title, "description": note.description});
    return 42;
  }

  Future<int> updateNote(noteId, Note note) async {
    await noteCollection
        .doc(uid)
        .collection("my_notes")
        .doc(noteId)
        .update({"title": note.title, "description": note.description});
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    await noteCollection.doc(uid).collection("my_notes").doc(noteId).delete();
    return 42;
  }

  NoteCollection _noteListFromSnapshot(QuerySnapshot snapshot) {
    NoteCollection noteCollection = NoteCollection();
    for (var doc in snapshot.docs) {
      Note note = Note.fromMap(doc.data());
      noteCollection.insertNoteOfId(doc.id, note);
    }
    return noteCollection;
  }

  Future<NoteCollection> getNoteList() async {
    QuerySnapshot snapshot =
        await noteCollection.doc(uid).collection("my_notes").get();

    return _noteListFromSnapshot(snapshot);
  } /*  */

  /*
     Parte da STREAM
  */

  Stream get stream {
    return noteCollection
        .doc(uid)
        .collection("my_notes")
        .snapshots()
        .map(_noteListFromSnapshot);
  }
}
