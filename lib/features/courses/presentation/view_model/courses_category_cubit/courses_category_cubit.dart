import 'package:bloc/bloc.dart';
import 'package:courses_app/core/di/di.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/course_model.dart';

part 'courses_category_state.dart';

class CoursesCategoryCubit extends Cubit<CoursesCategoryState> {
  CoursesCategoryCubit(this._coursesRepo) : super(CoursesCategoryInitial());

  final CoursesRepo _coursesRepo;

  void getCoursesByCategory(String categoryId) async {
    emit(CoursesCategoryLoading());
    final result = await _coursesRepo.getCoursesByCategory(categoryId);
    result.fold(
      (failure) => emit(CoursesCategoryError(failure: failure)),
      (courses) => emit(
        CoursesCategorySuccess(courses: courses),
      ),
    );
  }
}
