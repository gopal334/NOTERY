import 'package:flutter/foundation.dart';
import 'db_helper.dart';      // DBHelper yaha se aayega
import 'note_model.dart';    // Note yaha se aayega

class NotesProvider extends ChangeNotifier {
  final DBHelper _dbHelper = DBHelper();
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> loadNotes() async {
    _notes = await _dbHelper.getNotes();
    notifyListeners();
  }

  Future<void> addNote(String title, String description) async {
    final note = Note(title: title, description: description);
    await _dbHelper.insert(note);
    await loadNotes();
  }

  Future<void> updateNote(int id, String title, String description) async {
    final note = Note(id: id, title: title, description: description);
    await _dbHelper.update(note);
    await loadNotes();
  }

  Future<void> removeNote(int id) async {
    await _dbHelper.delete(id);
    await loadNotes();
  }
}
