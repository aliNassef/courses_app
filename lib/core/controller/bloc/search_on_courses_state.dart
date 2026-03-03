part of 'search_on_courses_bloc.dart';

sealed class SearchOnCoursesState extends Equatable {
  const SearchOnCoursesState();

  @override
  List<Object> get props => [];
}

final class SearchOnCoursesInitial extends SearchOnCoursesState {}

final class SearchOnCoursesLoading extends SearchOnCoursesState {}

final class SearchOnCoursesSuccess extends SearchOnCoursesState {
  final List<SearchModel> courses;
  const SearchOnCoursesSuccess({required this.courses});

  @override
  List<Object> get props => [courses];
}

final class SearchOnCoursesError extends SearchOnCoursesState {
  final Failure failure;
  const SearchOnCoursesError({required this.failure});

  @override
  List<Object> get props => [failure];
}
