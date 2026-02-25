import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import '../../errors/failure.dart';
import 'storage_service.dart';

class StorageServiceImpl extends StorageService {
  final FirebaseStorage _storage;

  StorageServiceImpl(this._storage);

  @override
  Future<Either<Failure, String>> uploadImage({
    required String path,
    required File file,
  }) async {
    try {
      final fileName = p.basename(file.path);
      final ref = _storage.ref().child(path).child(fileName);

      final uploadTask = ref.putFile(file);

      final snapshot = await uploadTask;
      final url = await snapshot.ref.getDownloadURL();
      return right(url);
    } on Exception catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }
}
