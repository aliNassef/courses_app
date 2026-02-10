import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/errors/server_exception.dart';
import '../../models/chapter_model.dart';
import '../../models/lesson_model.dart';
import '../../source/lesson_remote_datasource.dart';
import 'lesson_repo.dart';

class LessonRepoImpl implements LessonRepo {
  final LessonRemoteDatasource remoteDatasource;

  LessonRepoImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<LessonModel>>> getLessonsByCourseId(
    String courseId,
  ) async {
    try {
      final lessons = await remoteDatasource.getLessonsByCourseId(courseId);
      return Right(lessons);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, LessonModel>> getLessonsByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  ) async {
    try {
      final lesson = await remoteDatasource.getLessonByCourseIdAndLessonNumber(
        courseId,
        lessonNumber,
      );
      return Right(lesson);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, LessonModel>> getLessonsByCourseIdAndLessonId(
    String courseId,
    String lessonId,
  ) async {
    try {
      final lesson = await remoteDatasource.getLessonByCourseIdAndLessonId(
        courseId,
        lessonId,
      );
      return Right(lesson);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, LessonModel>> getLastLessonWatched(
    String courseId,
    String userId,
  ) async {
    try {
      final lesson = await remoteDatasource.getLastWatchedLesson(
        courseId,
        userId,
      );
      return Right(lesson);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ChapterModel>>> getChaptersByCourseId(
    String courseId,
  ) async {
    try {
      final chapters = await remoteDatasource.getChaptersByCourseId(courseId);
      return Right(chapters);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}