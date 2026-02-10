import '../../../../core/services/database/database.dart';
import '../models/chapter_model.dart';
import '../models/lesson_model.dart';

abstract class LessonRemoteDatasource {
  Future<List<LessonModel>> getLessonsByCourseId(String courseId);
  Future<List<ChapterModel>> getChaptersByCourseId(String courseId);
  Future<LessonModel> getLessonByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  );
  Future<LessonModel> getLessonByCourseIdAndLessonId(
    String courseId,
    String lessonId,
  );

  Future<LessonModel> getLastWatchedLesson(
    String courseId,
    String userId,
  );
}

class LessonRemoteDatasourceImpl implements LessonRemoteDatasource {
  final Database database;

  LessonRemoteDatasourceImpl({required this.database});
  @override
  Future<List<LessonModel>> getLessonsByCourseId(String courseId) async {
    final lessons = await database.getLessonsByCourseId(courseId);
    return lessons
        .map(
          (lesson) => LessonModel.fromJson(
            lesson.data() as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<LessonModel> getLessonByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  ) async {
    final lesson = await database.getLessonByCourseIdAndLessonNumber(
      courseId,
      lessonNumber,
    );
    return LessonModel.fromJson(
      lesson.data() as Map<String, dynamic>,
    );
  }

  @override
  Future<List<ChapterModel>> getChaptersByCourseId(String courseId) async =>
      database.getChaptersByCourseId(courseId);

  @override
  Future<LessonModel> getLessonByCourseIdAndLessonId(
    String courseId,
    String lessonId,
  ) async {
    final lesson = await database.getLessonByCourseIdAndLessonId(
      courseId,
      lessonId,
    );
    return LessonModel.fromJson(
      lesson,
    );
  }

  @override
  Future<LessonModel> getLastWatchedLesson(
    String courseId,
    String userId,
  ) async {
    final lesson = await database.getLastWatchedLesson(courseId, userId);
    return LessonModel.fromJson(lesson);
  }
}
