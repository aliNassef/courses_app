import 'package:bloc/bloc.dart';
import 'package:courses_app/core/constants/constants.dart';
import 'package:courses_app/core/repo/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../errors/failure.dart';
import '../../models/search_model.dart';

part 'search_on_courses_event.dart';
part 'search_on_courses_state.dart';

class SearchOnCoursesBloc
    extends Bloc<SearchOnCoursesEvent, SearchOnCoursesState> {
  final SearchRepo _searchRepo;
  SearchOnCoursesBloc({required SearchRepo searchRepo})
    : _searchRepo = searchRepo,
      super(SearchOnCoursesInitial()) {
    on<SearchOnCoursesEvent>(
      (event, emit) async {
        if (event.query.trim().isEmpty) {
          emit(SearchOnCoursesInitial());
          return;
        }
        emit(SearchOnCoursesLoading());
        final result = await _searchRepo.searchOnQuery(
          event.query,
          event.userId,
        );
        result.fold(
          (failure) => emit(SearchOnCoursesError(failure: failure)),
          (result) => emit(SearchOnCoursesSuccess(courses: result)),
        );
      },
      transformer: (events, mapper) =>
          events.debounceTime(Constants.debounceDuration).switchMap(mapper),
    );
  }
}
