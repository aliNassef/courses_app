 
import '../../../../core/services/database/database.dart';
import '../models/discuss_model.dart';

abstract class DiscussionRemoteDatasource {
  Future<void> addDiscussions(
    String courseId,
    DiscussionModel discussionModel,
  );

  Future<List<DiscussionModel>> getDiscussions(String courseId);

  Future<void> toggleLike(
    String courseId,
    String discussionId,
    String userId,
  );

  Future<Set<String>> getMyLikedDiscussions({
    required String courseId,
    required String userId,
  });
}

class DiscussionRemoteDatasourceImpl implements DiscussionRemoteDatasource {
  final Database database;

  DiscussionRemoteDatasourceImpl({required this.database});
  @override
  Future<void> addDiscussions(
    String courseId,
    DiscussionModel discussionModel,
  ) async => database.addDiscussionToCourse(
    courseId: courseId,
    discussion: discussionModel,
  );

  @override
  Future<List<DiscussionModel>> getDiscussions(String courseId) async =>
      database.getDiscussions(courseId);

  @override
  Future<void> toggleLike(
    String courseId,
    String discussionId,
    String userId,
  ) async => database.toggleLike(courseId, discussionId, userId);

  @override
  Future<Set<String>> getMyLikedDiscussions({
    required String courseId,
    required String userId,
  }) async => database.getMyLikedDiscussions(
    courseId: courseId,
    userId: userId,
  );
}
