import 'package:courses_app/features/courses/data/repo/discuss/discussion_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/errors/server_exception.dart';
import '../../models/discuss_model.dart';
import '../../source/discussion_remote_datasource.dart';

class DiscussionRepoImpl implements DiscussionRepo {
  final DiscussionRemoteDatasource remoteDatasource;

  DiscussionRepoImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, void>> addDiscussion(
    String courseId,
    DiscussionModel discussionModel,
  ) async {
    try {
      await remoteDatasource.addDiscussions(
        courseId,
        discussionModel,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<DiscussionModel>>> getDiscussions(
    String courseId,
  ) async {
    try {
      final discussions = await remoteDatasource.getDiscussions(courseId);
      return Right(discussions);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

   @override
  Future<Either<Failure, void>> toggleLike(
    String courseId,
    String discussionId,
    String userId,
  ) async {
    try {
      await remoteDatasource.toggleLike(
        courseId,
        discussionId,
        userId,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, Set<String>>> getMyLikedDiscussions({
    required String courseId,
    required String userId,
  }) async {
    try {
      final likes = await remoteDatasource.getMyLikedDiscussions(
        courseId: courseId,
        userId: userId,
      );
      return Right(likes);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}
