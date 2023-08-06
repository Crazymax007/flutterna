// ignore_for_file: unused_import

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await saveUserToFirestore(email, 'user');

      log('Register success');
    } on FirebaseAuthException catch (e) {
      log('Register error: ${e.message.toString()}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUserToFirestore(String email, String role) async {
    final reference = FirebaseFirestore.instance.collection('users');

    try {
      final User? user = _auth.currentUser;
      await reference.doc(user!.uid).set(
            UserModel(
                    id: user.uid,
                    email: user.email!,
                    role: role,
                    createdAt: DateTime.now().toString(),
                    updateAt: DateTime.now().toString())
                .toJson(),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    final ref = FirebaseFirestore.instance.collection('users');
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      ref.doc(_auth.currentUser!.uid).get().then((value) {
        _userModel = UserModel.fromJson(value.data()!);
      });

      log('Login success');
    } on FirebaseAuthException catch (e) {
      log('Login error: ${e.message.toString()}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      log('logout success');
    } catch (e) {
      log('logout error: ${e.toString()}');
      rethrow;
    }
  }
}
