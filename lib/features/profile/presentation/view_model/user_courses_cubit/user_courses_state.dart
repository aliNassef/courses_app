part of 'user_courses_cubit.dart';

sealed class UserCoursesState extends Equatable {
  const UserCoursesState();

  @override
  List<Object> get props => [];
}

final class UserCoursesInitial extends UserCoursesState {}

final class UserCoursesLoading extends UserCoursesState {}

final class UserCoursesSuccess extends UserCoursesState {
  final int count;
  const UserCoursesSuccess({required this.count});
}

final class UserCoursesFailure extends UserCoursesState {
  final Failure failure;
  const UserCoursesFailure({required this.failure});
}
