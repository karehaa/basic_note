import 'dart:developer';

import 'package:basic_note/model/note_model.dart';
import 'package:basic_note/services/auth/auth_page.dart';
import 'package:basic_note/services/notes/note_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCubit extends Cubit<List<NoteModel>> {
  NoteCubit() : super([]);

  final NoteService noteService = NoteService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<String> getId() async {
    final User user = auth.currentUser!;
    final String uid = user.uid;
    return uid;
  }

  Future<void> loadNotes() async {
    try {
      final notes = await noteService.getNotes(getId().toString());
      emit(notes);
    } catch (e) {
      log("Error: $e");
    }
  }

  Future<void> addNote(BuildContext context, NoteModel note) async {
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder:
          (context) =>
              const Center(child: CircularProgressIndicator.adaptive()),
    );
    try {
      await noteService.addNote(getId().toString(), note);
      await loadNotes();
      if (context.mounted) {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
          (route) => false,
        );
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  Future<void> updateNote(BuildContext context, NoteModel note) async {
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder:
          (context) =>
              const Center(child: CircularProgressIndicator.adaptive()),
    );
    try {
      await noteService.updateNote(getId().toString(), note);
      await loadNotes();
      if (context.mounted) {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
          (route) => false,
        );
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
