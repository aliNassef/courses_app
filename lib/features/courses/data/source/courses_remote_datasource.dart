import '../../../../core/di/di.dart';
import '../models/course_model.dart';
import '../models/instructor_model.dart';

abstract class CoursesRemoteDatasource {
  Future<List<CourseModel>> getCourses();
  Future<List<CourseModel>> getBestSellerCourses();
  Future<InstructorModel> getInstructorInfo(String instructorId);
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

  @override
  Future<InstructorModel> getInstructorInfo(String instructorId) async {
    final instructor = await database.getInstructor(instructorId);
    return InstructorModel.fromMap(instructor.data() as Map<String, dynamic>);
  }

  @override
  Future<List<CourseModel>> getCoursesByCategory(String categoryId) async {
    final courses = await database.getCoursesByCategory(categoryId);
    return courses
        .map(
          (course) =>
              CourseModel.fromJson(course.data() as Map<String, dynamic>),
        )
        .toList();
  }
}
