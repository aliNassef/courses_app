import 'package:bloc/bloc.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/errors/failure.dart';

import '../../../data/models/course_level_enum.dart';
import '../../../data/models/course_model.dart';
import '../../filter_enum.dart';

part 'courses_category_state.dart';

class CoursesCategoryCubit extends Cubit<CoursesCategoryState> {
  CoursesCategoryCubit(this._coursesRepo) : super(CoursesCategoryInitial());

  final CoursesRepo _coursesRepo;
  List<CourseModel> _courses = [];
  void getCoursesByCategory(String categoryId) async {
    emit(CoursesCategoryLoading());
    final result = await _coursesRepo.getCoursesByCategory(categoryId);
    result.fold(
      (failure) => emit(CoursesCategoryError(failure: failure)),
      (courses) {
        _courses = courses;
        emit(
          CoursesCategorySuccess(courses: courses),
        );
      },
    );
  }

  void onFilterChange(Filter filter) {
    if (state is! CoursesCategorySuccess) return;

    final courses = (state as CoursesCategorySuccess).courses;
    switch (filter) {
      case Filter.name:
        courses.sort((a, b) => a.title.compareTo(b.title));
        break;
      case Filter.price:
        courses.sort((a, b) => a.price.compareTo(b.price));
        break;
      case Filter.rating:
        courses.sort((a, b) => a.rating.compareTo(b.rating));
        break;
    }
    emit(
      CoursesCategorySuccess(
        courses: courses,
      ),
    );
  }

  void onLevelChange(CourseLevel level) {
    if (state is! CoursesCategorySuccess) return;
    if (level == CourseLevel.all) {
      emit(
        CoursesCategorySuccess(
          courses: _courses,
        ),
      );
      return;
    }
    final courses = _courses;
    final filteredCourses = courses.where((course) => course.level == level);
    emit(
      CoursesCategorySuccess(
        courses: filteredCourses.toList(),
      ),
    );
  }
}
