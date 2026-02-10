import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../models/discuss_model.dart';

abstract class DiscussionRepo {
  Future<Either<Failure, List<DiscussionModel>>> getDiscussions(
    String courseId,
  );
  Future<Either<Failure, void>> addDiscussion(
    String courseId,
    DiscussionModel discussionModel,
  );
  Future<Either<Failure, void>> toggleLike(
    String courseId,
    String discussionId,
    String userId,
  );

  Future<Either<Failure, Set<String>>> getMyLikedDiscussions({
    required String courseId,
    required String userId,
  });
}
