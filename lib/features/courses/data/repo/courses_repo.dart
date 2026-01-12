import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/course_model.dart';
import '../models/instructor_model.dart';

abstract class CoursesRepo {
  Future<Either<Failure, List<CourseModel>>> getCourses();
  Future<Either<Failure, List<CourseModel>>> getBestSellerCourses();
  Future<Either<Failure, InstructorModel>> getInstructorInfo(String instructorId);
  Future<Either<Failure, List<CourseModel>>> getCoursesByCategory(String categoryId);
}
