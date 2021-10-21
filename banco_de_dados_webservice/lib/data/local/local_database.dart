// Data Provider para o banco de dados local sqflite

import 'dart:async';
import 'dart:io';

import 'package:banco_de_dados_webservice/model/collection/note_collection.dart';
import 'package:banco_de_dados_webservice/model/note.dart';

class DatabaseRemoteServer {
  // Atributo que irá afunilar todas as consultas
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();

  // Construtor privado
  DatabaseRemoteServer._createInstance();

  // Configuração do banco: nomes de tabelas.
  String noteTable = "note_table";
  String colId = "id"; // Auto-numerar
  String colTitle = "title";
  String colDescription = "description";

  Future<int> insertNote(Note note) async {
    int result = 42;
    notify(result, note);
    return result;
  }

  Future<int> updateNote(int noteId, Note note) async {
    int result = 42;
    notify(noteId, note);
    return result;
  }

  Future<int> deleteNote(int noteId) async {
    int result = 42;
    notify(noteId, null);
    return result;
  }

  Future<NoteCollection> getNoteList() async {
    NoteCollection noteCollection = NoteCollection();
    return noteCollection;
  } /*  */

  /*
     Parte da STREAM
  */
  notify(int noteId, Note? note) async {
    _controller?.sink.add([noteId, note]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();
    return _controller!.stream;
  }

  dispose() {
    if (_controller != null) {
      if (!_controller!.hasListener) {
        _controller!.close();
        _controller = null;
      }
    }
  }

  static StreamController? _controller;
}
