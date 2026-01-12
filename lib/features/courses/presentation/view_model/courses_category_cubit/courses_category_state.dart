part of 'courses_category_cubit.dart';

sealed class CoursesCategoryState extends Equatable {
  const CoursesCategoryState();

  @override
  List<Object> get props => [];
}

final class CoursesCategoryInitial extends CoursesCategoryState {}

final class CoursesCategoryLoading extends CoursesCategoryState {}

final class CoursesCategorySuccess extends CoursesCategoryState {
  final List<CourseModel> courses;

  const CoursesCategorySuccess({required this.courses});

  @override
  List<Object> get props => [courses];
}

final class CoursesCategoryError extends CoursesCategoryState {
  final Failure failure;

  const CoursesCategoryError({required this.failure});

  @override
  List<Object> get props => [failure];
}
