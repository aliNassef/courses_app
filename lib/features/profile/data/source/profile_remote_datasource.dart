import 'package:courses_app/core/di/di.dart';

abstract class ProfileRemoteDataSource {
  Future<int> getUserSubscriptions(String userId);
  Future<void> getUserProfile(String userId);
  Future<void> updateProfile(String userId, Map<String, dynamic> data);
  Future<void> updateProfileImage(String userId, String imageUrl);
  Future<int> getUserAchivements(String userId);
  Future<int> getUserCertificates(String userId);
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
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile(String userId, Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfileImage(String userId, String imageUrl) async {
    await _database.updateUserProfileImage(userId, imageUrl);
  }

  @override
  Future<int> getUserAchivements(String userId) =>
      _database.getUserAchivements(userId);

  @override
  Future<int> getUserCertificates(String userId) {
    // TODO: implement getUserCertificates
    throw UnimplementedError();
  }
}
