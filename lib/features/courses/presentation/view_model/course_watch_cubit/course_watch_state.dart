part of 'course_watch_cubit.dart';

sealed class CourseWatchState extends Equatable {
  const CourseWatchState();

  @override
  List<Object> get props => [];
}

final class CourseWatchInitial extends CourseWatchState {}

final class GetChaptersByCourseIdLoading extends CourseWatchState {}

final class GetChaptersByCourseIdError extends CourseWatchState {
  final Failure failure;
  const GetChaptersByCourseIdError({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetChaptersByCourseIdSuccess extends CourseWatchState {
  final List<ChapterModel> chapters;
  const GetChaptersByCourseIdSuccess({required this.chapters});

  @override
  List<Object> get props => [chapters];
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
