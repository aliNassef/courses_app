import 'dart:io';

import 'package:courses_app/core/di/di.dart';

abstract class ProfileRemoteDataSource {
  Future<int> getUserSubscriptions(String userId);
  Future<void> getUserProfile(String userId);
  Future<void> updateProfile(String userId, Map<String, dynamic> data);
  Future<void> updateProfileImage(String userId, File image);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Database _database;

  ProfileRemoteDataSourceImpl({required Database database})
    : _database = database;
  @override
  Future<int> getUserSubscriptions(String userId) async {
    final userCoursesSnap = await _database.getUserCourses(userId);
    return userCoursesSnap.length;
  }

  @override
  Future<void> getUserProfile(String userId) {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile(String userId, Map<String, dynamic> data) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfileImage(String userId, File image) {
    // TODO: implement updateProfileImage
    throw UnimplementedError();
  }
}
