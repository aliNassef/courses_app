import 'package:courses_app/features/courses/data/models/reply_model.dart';

import '../../../../core/services/database/database.dart';

abstract class ReplyRemoteDatasource {
  Future<void> addReplyToDiscussion({
    required String courseId,
    required String discussionId,
    required ReplyModel reply,
  });

  Future<List<ReplyModel>> getReplies(
    String courseId,
    String discussionId,
  );
}

class ReplyRemoteDatasourceImpl implements ReplyRemoteDatasource {
  final Database database;

  ReplyRemoteDatasourceImpl({required this.database});
  @override
  Future<void> addReplyToDiscussion({
    required String courseId,
    required String discussionId,
    required ReplyModel reply,
  }) async => database.addReplyToDiscussion(
    courseId: courseId,
    discussionId: discussionId,
    reply: reply,
  );
  @override
  Future<List<ReplyModel>> getReplies(
    String courseId,
    String discussionId,
  ) async => database.getReplies(courseId, discussionId);
}
