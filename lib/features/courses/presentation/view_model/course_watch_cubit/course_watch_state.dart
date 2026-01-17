part of 'course_watch_cubit.dart';

sealed class CourseWatchState extends Equatable {
  const CourseWatchState();

  @override
  List<Object> get props => [];
}

final class CourseWatchInitial extends CourseWatchState {}

final class GetLessonsByCourseIdLoading extends CourseWatchState {}

final class GetLessonsByCourseIdError extends CourseWatchState {
  final Failure failure;
  const GetLessonsByCourseIdError({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetLessonsByCourseIdSuccess extends CourseWatchState {
  final List<LessonModel> lessons;
  const GetLessonsByCourseIdSuccess({required this.lessons});

  @override
  List<Object> get props => [lessons];
}

final class GetLessonsByCourseIdAndLessonNumberLoading
    extends CourseWatchState {}

final class GetLessonByCourseIdAndLessonNumberSuccess extends CourseWatchState {
  final LessonModel lesson;
  const GetLessonByCourseIdAndLessonNumberSuccess({required this.lesson});

  @override
  List<Object> get props => [lesson];
}

final class GetLessonByCourseIdAndLessonNumberError extends CourseWatchState {
  final Failure failure;
  const GetLessonByCourseIdAndLessonNumberError({required this.failure});

  @override
  List<Object> get props => [failure];
}
