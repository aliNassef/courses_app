part of 'user_courses_cubit.dart';

sealed class UserCoursesState extends Equatable {
  const UserCoursesState();

  @override
  List<Object> get props => [];
}

final class UserCoursesInitial extends UserCoursesState {}

final class UserCoursesLoading extends UserCoursesState {}

final class UserCoursesSuccess extends UserCoursesState {
  final int? coursesCount;
  final int? achivementsCount;
  UserCoursesSuccess copyWith({
    int? coursesCount,
    int? achivementsCount,
  }) => UserCoursesSuccess(
    coursesCount: coursesCount ?? this.coursesCount,
    achivementsCount: achivementsCount ?? this.achivementsCount,
  );
  const UserCoursesSuccess({
    this.coursesCount,
    this.achivementsCount,
  });
  @override
  List<Object> get props => [coursesCount ?? 0, achivementsCount ?? 0];
}

final class UserCoursesFailure extends UserCoursesState {
  final Failure failure;
  const UserCoursesFailure({required this.failure});
}
