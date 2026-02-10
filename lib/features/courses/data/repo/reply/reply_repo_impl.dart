import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/errors/server_exception.dart';
import '../../models/reply_model.dart';
import '../../source/reply_remote_datasource.dart';
import 'reply_repo.dart';

class ReplyRepoImpl implements ReplyRepo {
  final ReplyRemoteDatasource remoteDatasource;

  ReplyRepoImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, void>> addReplyToDiscussion({
    required String courseId,
    required String discussionId,
    required ReplyModel reply,
  }) async {
    try {
      await remoteDatasource.addReplyToDiscussion(
        courseId: courseId,
        discussionId: discussionId,
        reply: reply,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ReplyModel>>> getReplies(
    String courseId,
    String discussionId,
  ) async {
    try {
      final replies = await remoteDatasource.getReplies(
        courseId,
        discussionId,
      );
      return Right(replies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}