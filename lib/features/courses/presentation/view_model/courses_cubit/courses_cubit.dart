import 'package:bloc/bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/lesson_model.dart';
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

  void getLessonsByCourseId(String courseId) async {
    emit(GetLessonsByCourseIdLoading());
    final lessonsOrFailure = await repo.getLessonsByCourseId(courseId);
    lessonsOrFailure.fold(
      (failure) => emit(GetLessonsByCourseIdError(failure: failure)),
      (lessons) => emit(GetLessonsByCourseIdSuccess(lessons: lessons)),
    );
  }

  Future<void> getLessonsByCourseIdAndLessonNumber(
    String courseId,
    int lessonNumber,
  ) async {
    emit(GetLessonsByCourseIdAndLessonNumnerLoading());
    final lessonsOrFailure = await repo.getLessonsByCourseIdAndLessonNumber(
      courseId,
      lessonNumber,
    );
    lessonsOrFailure.fold(
      (failure) =>
          emit(GetLessonByCourseIdAndLessonNumnerError(failure: failure)),
      (lesson) =>
          emit(GetLessonByCourseIdAndLessonNumnerSuccess(lesson: lesson)),
    );
  }


}
