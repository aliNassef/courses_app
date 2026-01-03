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
