part of 'course_discovery_cubit.dart';

sealed class CourseDiscoveryState extends Equatable {
  const CourseDiscoveryState();

  @override
  List<Object> get props => [];
}

final class CourseDiscoveryInitial extends CourseDiscoveryState {}

final class GetAllCoursesLoading extends CourseDiscoveryState {}

final class GetAllCoursesSuccess extends CourseDiscoveryState {
  final List<CourseModel> courses;
  const GetAllCoursesSuccess({required this.courses});

  @override
  List<Object> get props => [courses];
}

final class GetAllCoursesError extends CourseDiscoveryState {
  final Failure failure;
  const GetAllCoursesError({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetBestSellerCoursesLoading extends CourseDiscoveryState {}

final class GetBestSellerCoursesSuccess extends CourseDiscoveryState {
  final List<CourseModel> courses;
  const GetBestSellerCoursesSuccess({required this.courses});

  @override
  List<Object> get props => [courses];
}

final class GetBestSellerCoursesError extends CourseDiscoveryState {
  final Failure failure;
  const GetBestSellerCoursesError({required this.failure});

  @override
  List<Object> get props => [failure];
}
