import 'package:basic_note/bloc/page_cubit.dart';
import 'package:basic_note/services/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthService extends PageCubit {
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<void> signIn(
    BuildContext context,
    String username,
    String password,
  ) async {
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator.adaptive()),
    );

    try {
      String loggedEmail = "$username@gmail.com";
      await auth.signInWithEmailAndPassword(
        email: loggedEmail,
        password: password,
      );

      if (context.mounted) {
        context.read<PageCubit>().emit(PageState.authenticated);
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<void> signUp(
    BuildContext context,
    String username,
    String namaLengkap,
    String password,
  ) async {
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator.adaptive()),
    );

    try {
      String parsedUsername = username.toLowerCase();
      String loggedEmail = "$parsedUsername@gmail.com";

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: loggedEmail,
        password: password,
      );

      await store.collection("users").doc(userCredential.user!.uid).set({
        "username": username,
        "nama_lengkap": namaLengkap,
        "email": loggedEmail,
      });

      if (context.mounted) {
        context.read<PageCubit>().emit(PageState.authenticated);
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator.adaptive()),
    );
    try {
      await auth.signOut();

      if (context.mounted) {
        context.read<PageCubit>().emit(PageState.unauthenticated);
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<String?> getUsername() async {
    try {
      User? user = auth.currentUser;
      if (user == null) return null;

      DocumentSnapshot userDoc =
          await store.collection('users').doc(user.uid).get();

      return userDoc["username"];
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<String?> getNamaLengkap() async {
    try {
      User? user = auth.currentUser;
      if (user == null) return null;

      DocumentSnapshot userDoc =
          await store.collection('users').doc(user.uid).get();

      return userDoc["nama_lengkap"];
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
