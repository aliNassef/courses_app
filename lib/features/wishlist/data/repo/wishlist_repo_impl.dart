import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_exception.dart';

import '../models/wishlist_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/logging/app_logger.dart';
import '../../../courses/data/models/course_model.dart';
import '../source/wishlist_remote_datasoure.dart';
import 'wishlist_repo.dart';

class WishlistRepoImpl implements WishlistRepo {
  final WishlistRemoteDatasource remoteDatasource;

  const WishlistRepoImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, void>> addCourseToWishlist(
    String userId,
    WishlistModel wishlist,
  ) async {
    try {
      await remoteDatasource.addCourseToWishlist(userId, wishlist);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getWishlistCourses(
    String userId,
  ) async {
    try {
      final wishlistCourses = await remoteDatasource.getWishlistCourses(userId);
      return Right(wishlistCourses);
    } on ServerException catch (e) {
      AppLogger.error(e.message);
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeCourseFromWishlist(
    String userId,
    String courseId,
  ) async {
    try {
      await remoteDatasource.removeCourseFromWishlist(userId, courseId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}
