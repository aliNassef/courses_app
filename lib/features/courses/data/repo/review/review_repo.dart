import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../models/review_model.dart';

abstract class ReviewRepo {
  Future<Either<Failure, void>> addReview(
    String courseId,
    ReviewModel reviewModel,
  );
}