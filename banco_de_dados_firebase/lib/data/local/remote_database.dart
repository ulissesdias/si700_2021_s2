// Data Provider para o banco de dados local sqflite

import 'dart:async';
import 'dart:convert';

import 'package:banco_de_dados_firebase/model/collection/note_collection.dart';
import 'package:banco_de_dados_firebase/model/note.dart';

class DatabaseRemoteServer {
  // Atributo que irá afunilar todas as consultas
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();

  // Construtor privado
  DatabaseRemoteServer._createInstance();

  Future<Note> getNote(noteId) async {
    return Note();
  }

  Future<int> insertNote(Note note) async {
    return 42;
  }

  Future<int> updateNote(noteId, Note note) async {
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    return 42;
  }

  Future<NoteCollection> getNoteList() async {
    return NoteCollection();
  } /*  */

  /*
     Parte da STREAM
  */
  notify(String noteId, Note? note) async {
    _controller?.sink.add([noteId, note]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();
    return _controller!.stream;
  }

  static StreamController? _controller;
}
