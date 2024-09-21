import 'package:batch3/sqflite/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite{
  //int database

  Future<Database> intDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path,'database1.db'),
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE Batch3 (id INTEGER PRIMARY KEY, description TEXT)');
      },
      version: 1
    );
  }

  //insert
  Future addNote(Note note) async {
    final Database db = await intDB();
    var data = await db.insert('Batch3', note.toMap());
    return data;
  } 

  //get
  Future<List<Note>> getNotes() async {
    final Database db = await intDB();
    List<Map<String, Object?>> data = await db.query('Batch3');

    return data.map((e) => Note.fromMap(e)).toList();
  }

  //update
  Future<void> updateNote(Note note) async {
    final Database db = await intDB();
    await db.update('Batch3', note.toMap(),where: 'id = ?', whereArgs: [note.id]);
  } 

  //delete
  Future<void> deleteNote(int id) async {
    final Database db = await intDB();
    await db.delete('Batch3',where: 'id = ?', whereArgs: [id]);
  } 


}