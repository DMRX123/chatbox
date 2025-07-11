import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile({
    required String filePath,
    required String storagePath,
  }) async {
    try {
      final ref = _storage.ref().child(storagePath).child(DateTime.now().millisecondsSinceEpoch.toString());
      final uploadTask = ref.putFile(File(filePath));
      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload file: \$e');
    }
  }
}