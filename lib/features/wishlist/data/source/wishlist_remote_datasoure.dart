import '../../../courses/data/models/course_model.dart';

import '../../../../core/di/di.dart';
import '../../../../core/logging/app_logger.dart';
import '../models/wishlist_model.dart';

abstract class WishlistRemoteDatasource {
  Future<void> addCourseToWishlist(String userId, WishlistModel wishlist);
  Future<List<CourseModel>> getWishlistCourses(String userId);
  Future<void> removeCourseFromWishlist(String userId, String courseId);
}

class WishlistRemoteDatasoureImpl implements WishlistRemoteDatasource {
  final Database _db;

  WishlistRemoteDatasoureImpl({required Database db}) : _db = db;
  @override
  Future<void> addCourseToWishlist(
    String userId,
    WishlistModel wishlist,
  ) async => _db.addToWishlist(
    userId: userId,
    courseId: wishlist.courseId,
    data: wishlist.toMap(),
  );

  @override
  Future<List<CourseModel>> getWishlistCourses(String userId) async {
    final wishlistCourses = await _db.getWishlistCourses(userId);
    return wishlistCourses.map(
      (course) {
        AppLogger.info(course.toString());
        return CourseModel.fromMap(course);
      },
    ).toList();
  }

  @override
  Future<void> removeCourseFromWishlist(
    String userId,
    String courseId,
  ) async => _db.removeFromWishlist(
    userId: userId,
    courseId: courseId,
  );
}
