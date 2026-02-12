import 'package:courses_app/core/services/database/database.dart';
import 'package:courses_app/features/courses/data/models/review_model.dart';

abstract class ReviewRemoteDatasource {
  Future<void> addReview(String courseId, ReviewModel reviewModel);
  Future<bool> hasUserReviewed(String courseId, String userId);
}

class ReviewRemoteDatasourceImpl implements ReviewRemoteDatasource {
  final Database database;

  ReviewRemoteDatasourceImpl({required this.database});
  @override
  Future<void> addReview(String courseId, ReviewModel reviewModel) async =>
      database.addReview(
        courseId: courseId,
        reviewId: reviewModel.userId,
        data: reviewModel.toMap(),
      );

  @override
  Future<bool> hasUserReviewed(String courseId, String userId) async =>
      database.hasUserReviewed(courseId, userId);
}
