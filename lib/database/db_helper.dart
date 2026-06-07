import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note_model.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._init();
  static Database? _database;

  DbHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('pink_notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        category TEXT NOT NULL,
        isFavorite INTEGER NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  Future<int> create(Note note) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final notesJson = prefs.getStringList('web_notes') ?? [];
      
      int maxId = 0;
      for (var jsonStr in notesJson) {
        final map = json.decode(jsonStr) as Map<String, dynamic>;
        final id = map['id'] as int?;
        if (id != null && id > maxId) {
          maxId = id;
        }
      }
      final newId = maxId + 1;
      
      final newNote = Note(
        id: newId,
        title: note.title,
        content: note.content,
        category: note.category,
        isFavorite: note.isFavorite,
        createdAt: note.createdAt,
      );
      
      notesJson.add(json.encode(newNote.toMap()));
      await prefs.setStringList('web_notes', notesJson);
      return newId;
    }

    final db = await instance.database;
    return await db.insert('notes', note.toMap());
  }

  Future<List<Note>> readAllNotes() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final notesJson = prefs.getStringList('web_notes') ?? [];
      final notes = notesJson.map((jsonStr) {
        return Note.fromMap(json.decode(jsonStr) as Map<String, dynamic>);
      }).toList();
      notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return notes;
    }

    final db = await instance.database;
    final result = await db.query('notes', orderBy: 'createdAt DESC');
    return result.map((json) => Note.fromMap(json)).toList();
  }

  Future<int> update(Note note) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final notesJson = prefs.getStringList('web_notes') ?? [];
      int index = -1;
      for (int i = 0; i < notesJson.length; i++) {
        final map = json.decode(notesJson[i]) as Map<String, dynamic>;
        if (map['id'] == note.id) {
          index = i;
          break;
        }
      }
      if (index != -1) {
        notesJson[index] = json.encode(note.toMap());
        await prefs.setStringList('web_notes', notesJson);
        return 1;
      }
      return 0;
    }

    final db = await instance.database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final notesJson = prefs.getStringList('web_notes') ?? [];
      int index = -1;
      for (int i = 0; i < notesJson.length; i++) {
        final map = json.decode(notesJson[i]) as Map<String, dynamic>;
        if (map['id'] == id) {
          index = i;
          break;
        }
      }
      if (index != -1) {
        notesJson.removeAt(index);
        await prefs.setStringList('web_notes', notesJson);
        return 1;
      }
      return 0;
    }

    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
