part of 'my_leaning_cubit.dart';

sealed class MyLearningState extends Equatable {
  const MyLearningState();

  @override
  List<Object> get props => [];
}

final class MyLearningInitial extends MyLearningState {}

final class MyLearningLoading extends MyLearningState {}

final class MyLearningSuccess extends MyLearningState {
  final List<MyLearningModel> learning;

  const MyLearningSuccess({required this.learning});

  @override
  List<Object> get props => [learning];
}

final class MyLearningFailure extends MyLearningState {
  final Failure failure;

  const MyLearningFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class AddCourseToMyLearningLoading extends MyLearningState {}

final class AddCourseToMyLearningSuccess extends MyLearningState {}

final class AddCourseToMyLearningFailure extends MyLearningState {
  final Failure failure;

  const AddCourseToMyLearningFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetLastLearningCourseLoading extends MyLearningState {}

final class GetLastLearningCourseSuccess extends MyLearningState {
  final MyLearningModel learning;

  const GetLastLearningCourseSuccess({required this.learning});

  @override
  List<Object> get props => [learning];
}

final class GetLastLearningCourseFailure extends MyLearningState {
  final Failure failure;

  const GetLastLearningCourseFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class UpdateCourseProgressSuccess extends MyLearningState {}

final class UpdateCourseProgressFailure extends MyLearningState {
  final Failure failure;

  const UpdateCourseProgressFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetCompletedLessonsIdsLoading extends MyLearningState {}

final class GetCompletedLessonsIdsSuccess extends MyLearningState {
  final Set<String> lessonsIds;
  const GetCompletedLessonsIdsSuccess({required this.lessonsIds});

  @override
  List<Object> get props => [lessonsIds];
}

final class GetCompletedLessonsIdsError extends MyLearningState {
  final Failure failure;
  const GetCompletedLessonsIdsError({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class OpenNextLesson extends MyLearningState {
  final String lessonId;
  const OpenNextLesson({required this.lessonId});

  @override
  List<Object> get props => [lessonId];
}

final class GetLastCompletedLessonDetailsLoading extends MyLearningState {}

final class GetLastCompletedLessonDetailsSuccess extends MyLearningState {
  final List<LessonModel> lessons;
  const GetLastCompletedLessonDetailsSuccess({required this.lessons});

  @override
  List<Object> get props => [lessons];
}

final class GetLastCompletedLessonDetailsError extends MyLearningState {
  final Failure failure;
  const GetLastCompletedLessonDetailsError({required this.failure});

  @override
  List<Object> get props => [failure];
}
