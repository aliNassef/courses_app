import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../models/reply_model.dart';

abstract class ReplyRepo {
  Future<Either<Failure, void>> addReplyToDiscussion({
    required String courseId,
    required String discussionId,
    required ReplyModel reply,
  });

  Future<Either<Failure, List<ReplyModel>>> getReplies(
    String courseId,
    String discussionId,
  );
}