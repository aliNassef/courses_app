part of 'my_leaning_cubit.dart';

sealed class MyLeaningState extends Equatable {
  const MyLeaningState();

  @override
  List<Object> get props => [];
}

final class MyLeaningInitial extends MyLeaningState {}

final class MyLeaningLoading extends MyLeaningState {}

final class MyLeaningSuccess extends MyLeaningState {
  final List<MyLearningModel> learning;

  const MyLeaningSuccess({required this.learning});

  @override
  List<Object> get props => [learning];
}

final class MyLeaningFailure extends MyLeaningState {
  final Failure failure;

  const MyLeaningFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class AddCourseToMyLeaningLoading extends MyLeaningState {}

final class AddCourseToMyLeaningSuccess extends MyLeaningState {}

final class AddCourseToMyLeaningFailure extends MyLeaningState {
  final Failure failure;

  const AddCourseToMyLeaningFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
