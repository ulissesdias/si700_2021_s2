// Data Provider para o banco de dados local sqflite

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:banco_de_dados_webservice/model/collection/note_collection.dart';
import 'package:banco_de_dados_webservice/model/note.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DatabaseRemoteServer {
  // Atributo que irá afunilar todas as consultas
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();

  // Construtor privado
  DatabaseRemoteServer._createInstance();

  final Dio _dio = Dio();
  String databaseUrl = "http://192.168.15.5:3000/database";

  Future<Note> getNote(noteId) async {
    Response response = await _dio.get(
      databaseUrl + "/$noteId",
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

  Future<int> updateNote(noteId, Note note) async {
    await _dio.put(databaseUrl + "/$noteId",
        options: Options(headers: {"Accept": "application/json"}),
        data:
            jsonEncode({"title": note.title, "description": note.description}));
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    await _dio.delete(
      databaseUrl + "/$noteId",
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
/*
  // Código antigo

    int id = 0;
    response.data.forEach((element) {
      if (element != null) {
        Note note = Note.fromMap(element);
        noteCollection.insertNoteOfId(id, note);
      }
      id++;
    });
*/
    response.data.forEach((element) {
      if (element != null) {
        Note note = Note.fromMap(element);
        String id = element["_id"];
        noteCollection.insertNoteOfId(id, note);
      }
    });

    return noteCollection;
  } /*  */

  /*
     Parte da STREAM
  */
  notify(String noteId, Note? note) async {
    _controller?.sink.add([noteId, note]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();

    Socket socket = io(
        "http://192.168.15.5:3000",
        OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
            .build());

    socket.on('server_information', (data) {
      String noteId = data["noteId"];
      String title = data["title"];
      String description = data["description"];

      if (title == "") {
        notify(noteId, null);
      } else {
        Note note = Note();
        note.title = title;
        note.description = description;
        notify(noteId, note);
      }
    });
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
