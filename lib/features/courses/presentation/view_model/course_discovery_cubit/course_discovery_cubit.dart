import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/course_model.dart';
import '../../../data/repo/courses_repo.dart';

part 'course_discovery_state.dart';

class CourseDiscoveryCubit extends Cubit<CourseDiscoveryState> {
  CourseDiscoveryCubit(this.repo) : super(CourseDiscoveryInitial());
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
