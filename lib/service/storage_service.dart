// ignore_for_file: unnecessary_brace_in_string_interps
import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(File image, String name) async {
    try {
      await storage.ref().child('images/${name}').putFile(image);
      log('Upload success');
    } on FirebaseException catch (e) {
      log('Upload error: ${e.toString()}');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> daleteFile(String image) async {
    try {
      await storage.ref().child(image).delete();
      log('Delete success');
    } on FirebaseException catch (e) {
      log('Delete error: ${e.toString()}');
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getImage(String image) async {
    try {
      final String url = await storage.ref().child(image).getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      log('Download error: ${e.toString()}');
    } catch (e) {
      rethrow;
    }
  }
}
