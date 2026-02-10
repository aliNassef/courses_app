import '../../../../core/di/di.dart';
import '../models/course_model.dart';

abstract class CoursesRemoteDatasource {
  Future<List<CourseModel>> getCourses();
  Future<List<CourseModel>> getBestSellerCourses();
  Future<List<CourseModel>> getCoursesByCategory(String categoryId);
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
              CourseModel.fromMap(course.data() as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<CourseModel>> getBestSellerCourses() async {
    final courses = await database.getBestSellerCourses();
    return courses
        .map(
          (course) =>
              CourseModel.fromMap(course.data() as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<CourseModel>> getCoursesByCategory(String categoryId) async {
    final courses = await database.getCoursesByCategory(categoryId);
    return courses
        .map(
          (course) =>
              CourseModel.fromMap(course.data() as Map<String, dynamic>),
        )
        .toList();
  }
}
