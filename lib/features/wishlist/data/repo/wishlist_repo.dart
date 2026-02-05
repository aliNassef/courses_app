import '../../../courses/data/models/course_model.dart';
import '../models/wishlist_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class WishlistRepo {
  Future<Either<Failure, void>> addCourseToWishlist(
    String userId,
    WishlistModel wishlist,
  );
  Future<Either<Failure, void>> removeCourseFromWishlist(
    String userId,
    String courseId,
  );
  Future<Either<Failure, List<CourseModel>>> getWishlistCourses(
    String userId,
  );
}
