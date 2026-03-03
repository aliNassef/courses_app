part of 'search_on_courses_bloc.dart';

class SearchOnCoursesEvent extends Equatable {
  const SearchOnCoursesEvent({required this.query, required this.userId});
  final String query;
  final String userId;
  @override
  List<Object> get props => [query];
}
