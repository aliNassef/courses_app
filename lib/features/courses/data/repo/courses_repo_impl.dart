import '../../../../core/errors/server_exception.dart';
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

 
}
