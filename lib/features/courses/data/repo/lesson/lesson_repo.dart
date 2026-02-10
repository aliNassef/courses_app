import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../models/chapter_model.dart';
import '../../models/lesson_model.dart';

abstract class LessonRepo {
  Future<Either<Failure, List<LessonModel>>> getLessonsByCourseId(
    String courseId,
  );

  Future<Either<Failure, LessonModel>> getLessonsByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  );

  Future<Either<Failure, LessonModel>> getLastLessonWatched(
    String courseId,
    String userId,
  );
  Future<Either<Failure, LessonModel>> getLessonsByCourseIdAndLessonId(
    String courseId,
    String lessonId,
  );
  Future<Either<Failure, List<ChapterModel>>> getChaptersByCourseId(
    String courseId,
  );
}
