// Data Provider para o banco de dados local sqflite

import 'dart:async';
import 'dart:io';

import 'package:banco_de_dados_local/model/collection/note_collection.dart';
import 'package:banco_de_dados_local/model/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocalServer {
  // Atributo que irá afunilar todas as consultas
  static DatabaseLocalServer helper = DatabaseLocalServer._createInstance();

  // Construtor privado
  DatabaseLocalServer._createInstance();

  // Objeto do SQFLite para fazer as requisições.
  static Database _database;

  static const INVALIDATE = 1;

  // Configuração do banco: nomes de tabelas.
  String noteTable = "note_table";
  String colId = "id"; // Auto-numerar
  String colTitle = "title";
  String colDescription = "description";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  // Gerar um arquivo e depois aplicar uma função que gera um banco de dados nesse arquivo.
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "notes.db";
    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  _createDb(Database db, int newVersion) {
    db.execute("""
       CREATE TABLE $noteTable (
           $colId INTEGER PRIMARY KEY AUTOINCREMENT,
           $colTitle TEXT,
           $colDescription TEXT
          );
    """);
  }

  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    int result = await db.insert(noteTable, note.toMap());
    //notify();
    notify(result, note);
    return result;
  }

  Future<int> updateNote(int noteId, Note note) async {
    Database db = await this.database;
    int result = await db.update(noteTable, note.toMap(),
        where: "$colId = ?", whereArgs: [noteId]);
    // notify();
    notify(noteId, note);
    return result;
  }

  Future<int> deleteNote(int noteId) async {
    Database db = await this.database;

    int result = await db.rawDelete("""
        DELETE FROM $noteTable WHERE $colId = $noteId;
      """);
    //notify();
    notify(noteId, null);
    return result;
  }

  Future<NoteCollection> getNoteList() async {
    Database db = await this.database;
    List<Map<String, Object>> noteMapList =
        await db.rawQuery("SELECT * FROM $noteTable;");
    NoteCollection noteCollection = NoteCollection();

    for (int i = 0; i < noteMapList.length; i++) {
      Note note = Note.fromMap(noteMapList[i]);

      noteCollection.insertNoteOfId(noteMapList[i][colId], note);
    }
    return noteCollection;
  }

  /*
     Parte da STREAM
  */
  notify(int noteId, Note note) async {
    if (_controller != null) {
      // _controller.sink.add(INVALIDATE);

      _controller.sink.add([noteId, note]);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController.broadcast();
    }
    return _controller.stream;
  }

  dispose() {
    if (!_controller.hasListener) {
      _controller.close();
      _controller = null;
    }
  }

  static StreamController _controller;
}
