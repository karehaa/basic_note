import 'package:basic_note/model/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteService {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> addNote(String userId, NoteModel note) async {
    await _store
        .collection('users')
        .doc(userId)
        .collection('notes')
        .add(note.toJson());
  }

  Future<void> updateNote(String userId, NoteModel note) async {
    final snapshot =
        await _store
            .collection('users')
            .doc(userId)
            .collection('notes')
            .doc()
            .get();
    final noteId = snapshot.reference.id;

    await _store
        .collection('users')
        .doc(userId)
        .collection('notes')
        .doc(noteId)
        .update(note.toJson());
  }

  Future<List<NoteModel>> getNotes(String userId) async {
    final snapshot =
        await _store.collection('users').doc(userId).collection('notes').get();

    return snapshot.docs.map((doc) => NoteModel.fromJson(doc.data())).toList();
  }
}
