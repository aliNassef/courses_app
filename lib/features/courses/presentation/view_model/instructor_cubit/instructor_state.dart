part of 'instructor_cubit.dart';

sealed class InstructorState extends Equatable {
  const InstructorState();

  @override
  List<Object> get props => [];
}

final class InstructorInitial extends InstructorState {}

final class InstructorLoading extends InstructorState {}

final class InstructorLoaded extends InstructorState {
  final InstructorModel instructor;

  const InstructorLoaded({required this.instructor});
  @override
  List<Object> get props => [instructor];
}

final class InstructorError extends InstructorState {
  final Failure failure;

  const InstructorError({required this.failure});
  @override
  List<Object> get props => [failure];
}
