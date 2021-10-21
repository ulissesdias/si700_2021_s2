// Data Provider para o banco de dados local sqflite

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:banco_de_dados_webservice/model/collection/note_collection.dart';
import 'package:banco_de_dados_webservice/model/note.dart';

class DatabaseRemoteServer {
  // Atributo que irá afunilar todas as consultas
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();

  // Construtor privado
  DatabaseRemoteServer._createInstance();

  Dio _dio = Dio();
  String databaseUrl = "LINK DO SERVIDOR QUANDO FOR CRIADO";

  Future<Note> getNote(id) async {
    Response response = await _dio.get(
      databaseUrl + "/noteId",
      options: Options(headers: {"Accept": "application/json"}),
    );
    return Note.fromMap(response.data);
  }

  Future<int> insertNote(Note note) async {
    await _dio.post(databaseUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data:
            jsonEncode({"title": note.title, "description": note.description}));
    return 42;
  }

  Future<int> updateNote(int noteId, Note note) async {
    await _dio.post(databaseUrl + "/noteId",
        options: Options(headers: {"Accept": "application/json"}),
        data:
            jsonEncode({"title": note.title, "description": note.description}));
    return 42;
  }

  Future<int> deleteNote(int noteId) async {
    await _dio.post(
      databaseUrl + "/noteId",
      options: Options(headers: {"Accept": "application/json"}),
    );
    return 42;
  }

  Future<NoteCollection> getNoteList() async {
    Response response = await _dio.get(
      databaseUrl,
      options: Options(headers: {"Accept": "application/json"}),
    );

    NoteCollection noteCollection = NoteCollection();

    int id = 0;
    response.data.forEach((element) {
      Note note = Note.fromMap(element);
      noteCollection.insertNoteOfId(id, note);
      id++;
    });

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
