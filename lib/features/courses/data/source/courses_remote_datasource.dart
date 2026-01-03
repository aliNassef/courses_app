import '../../../../core/di/di.dart';
import '../models/course_model.dart';

abstract class CoursesRemoteDatasource {
  Future<List<CourseModel>> getCourses();
  Future<List<CourseModel>> getBestSellerCourses();
}

class CoursesRemoteDatasourceImpl implements CoursesRemoteDatasource {
  final Database database;

  CoursesRemoteDatasourceImpl({required this.database});

  @override
  Future<List<CourseModel>> getCourses() async {
    final courses = await database.getCourses();
    return courses
        .map(
          (course) =>
              CourseModel.fromJson(course.data() as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<CourseModel>> getBestSellerCourses() async {
    final courses = await database.getBestSellerCourses();
    return courses
        .map(
          (course) =>
              CourseModel.fromJson(course.data() as Map<String, dynamic>),
        )
        .toList();
  }
}
