import 'package:bloc/bloc.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/course_model.dart';
import '../../../data/repo/courses_repo.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this.repo) : super(CoursesInitial());
  final CoursesRepo repo;

  void getAllCourses() async {
    emit(GetAllCoursesLoading());
    final coursesOrFailure = await repo.getCourses();
    coursesOrFailure.fold(
      (failure) => emit(GetAllCoursesError(failure: failure)),
      (courses) => emit(GetAllCoursesSuccess(courses: courses)),
    );
  }


  void getBestSellerCourses() async {
    emit(GetBestSellerCoursesLoading());
    final coursesOrFailure = await repo.getBestSellerCourses();
    coursesOrFailure.fold(
      (failure) => emit(GetBestSellerCoursesError(failure: failure)),
      (courses) => emit(GetBestSellerCoursesSuccess(courses: courses)),
    );
  }
}
