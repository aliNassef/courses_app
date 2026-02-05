import 'package:courses_app/features/courses/data/models/chapter_model.dart';
import 'package:courses_app/features/courses/data/models/reply_model.dart';
import 'package:courses_app/features/courses/data/models/review_model.dart';

import '../../../../core/errors/server_exception.dart';
import '../models/discuss_model.dart';
import '../models/lesson_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/course_model.dart';
import '../models/instructor_model.dart';
import '../source/courses_remote_datasource.dart';
import 'courses_repo.dart';

class CoursesRepoImpl implements CoursesRepo {
  final CoursesRemoteDatasource remoteDatasource;

  CoursesRepoImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses() async {
    try {
      final courses = await remoteDatasource.getCourses();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getBestSellerCourses() async {
    try {
      final courses = await remoteDatasource.getBestSellerCourses();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, InstructorModel>> getInstructorInfo(
    String instructorId,
  ) async {
    try {
      final instructor = await remoteDatasource.getInstructorInfo(instructorId);
      return Right(instructor);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getCoursesByCategory(
    String categoryId,
  ) async {
    try {
      final courses = await remoteDatasource.getCoursesByCategory(categoryId);
      return Right(courses);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }

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
  Future<Either<Failure, void>> addReview(
    String courseId,
    ReviewModel reviewModel,
  ) async {
    try {
      await remoteDatasource.addReview(courseId, reviewModel);
      return const Right(null);
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
  Future<Either<Failure, List<ReplyModel>>> getReplies(
    String courseId,
    String discussionId,
  ) async {
    try {
      final replies = await remoteDatasource.getReplies(courseId, discussionId);
      return Right(replies);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.message));
    }
  }
}
