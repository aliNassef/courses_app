import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/course_model.dart';

abstract class CoursesRepo {
  Future<Either<Failure, List<CourseModel>>> getCourses();
  Future<Either<Failure, List<CourseModel>>> getBestSellerCourses();
}
