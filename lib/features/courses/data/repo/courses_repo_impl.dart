import 'package:courses_app/core/errors/server_exception.dart';
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
      return Left(Failure(errMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<CourseModel>>> getBestSellerCourses()async {
    try {
      final courses = await remoteDatasource.getBestSellerCourses();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, InstructorModel>> getInstructorInfo(String instructorId)async {
    try {
      final instructor = await remoteDatasource.getInstructorInfo(instructorId);
      return Right(instructor);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
