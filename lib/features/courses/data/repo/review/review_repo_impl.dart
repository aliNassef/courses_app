import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/errors/server_exception.dart';
import '../../models/review_model.dart';
import '../../source/review_remote_datasource.dart';
import 'review_repo.dart';

class ReviewRepoImpl implements ReviewRepo {
  final ReviewRemoteDatasource remoteDatasource;

  ReviewRepoImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, void>> addReview(
    String courseId,
    ReviewModel reviewModel,
  ) async {
    try {
      await remoteDatasource.addReview(
        courseId,
        reviewModel,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}