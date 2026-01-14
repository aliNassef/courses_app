part of 'courses_cubit.dart';

sealed class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

final class CoursesInitial extends CoursesState {}

final class GetAllCoursesLoading extends CoursesState {}

final class GetAllCoursesSuccess extends CoursesState {
  final List<CourseModel> courses;
  const GetAllCoursesSuccess({required this.courses});

  @override
  List<Object> get props => [courses];
}

final class GetAllCoursesError extends CoursesState {
  final Failure failure;
  const GetAllCoursesError({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetBestSellerCoursesLoading extends CoursesState {}

final class GetBestSellerCoursesSuccess extends CoursesState {
  final List<CourseModel> courses;
  const GetBestSellerCoursesSuccess({required this.courses});

  @override
  List<Object> get props => [courses];
}

final class GetBestSellerCoursesError extends CoursesState {
  final Failure failure;
  const GetBestSellerCoursesError({required this.failure});

  @override
  List<Object> get props => [failure];
}

// for all lessons
final class GetLessonsByCourseIdLoading extends CoursesState {}

final class GetLessonsByCourseIdError extends CoursesState {
  final Failure failure;
  const GetLessonsByCourseIdError({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetLessonsByCourseIdSuccess extends CoursesState {
  final List<LessonModel> lessons;
  const GetLessonsByCourseIdSuccess({required this.lessons});

  @override
  List<Object> get props => [lessons];
}

// for one lesson
final class GetLessonsByCourseIdAndLessonNumnerLoading extends CoursesState {}

final class GetLessonByCourseIdAndLessonNumnerSuccess extends CoursesState {
  final LessonModel lesson;
  const GetLessonByCourseIdAndLessonNumnerSuccess({required this.lesson});

  @override
  List<Object> get props => [lesson];
}

final class GetLessonByCourseIdAndLessonNumnerError extends CoursesState {
  final Failure failure;
  const GetLessonByCourseIdAndLessonNumnerError({required this.failure});

  @override
  List<Object> get props => [failure];
}
