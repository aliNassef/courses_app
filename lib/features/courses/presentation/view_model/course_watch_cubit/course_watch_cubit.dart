import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/chapter_model.dart';
import '../../../data/models/lesson_model.dart';
import '../../../data/repo/course/courses_repo.dart';
import '../../../data/repo/lesson/lesson_repo.dart';

part 'course_watch_state.dart';

class CourseWatchCubit extends Cubit<CourseWatchState> {
  CourseWatchCubit(this.courseRepo, {required this.lessonRepo})
    : super(CourseWatchInitial());
  final CoursesRepo courseRepo;
  final LessonRepo lessonRepo;
  Future<void> init(String courseId, String userId) async {
    emit(GetSpecificLessonLoading());
    final lessonsOrFailure = await lessonRepo.getLastLessonWatched(
      courseId,
      userId,
    );
    lessonsOrFailure.fold(
      (failure) => emit(GetSpecificLessonError(failure: failure)),
      (lesson) => emit(GetSpecificLessonSuccess(lesson: lesson)),
    );
  }

  void getChaptersByCourseId(String courseId) async {
    emit(GetChaptersByCourseIdLoading());
    final chaptersOrFailure = await lessonRepo.getChaptersByCourseId(courseId);
    chaptersOrFailure.fold(
      (failure) => emit(GetChaptersByCourseIdError(failure: failure)),
      (chapters) {
        emit(GetChaptersByCourseIdSuccess(chapters: chapters));
      },
    );
  }

  void getLessonsByCourseIdAndLessonId(
    String courseId,
    String lessonId,
  ) async {
    emit(GetSpecificLessonLoading());
    final lessonsOrFailure = await lessonRepo.getLessonsByCourseIdAndLessonId(
      courseId,
      lessonId,
    );
    lessonsOrFailure.fold(
      (failure) => emit(GetSpecificLessonError(failure: failure)),
      (lesson) => emit(GetSpecificLessonSuccess(lesson: lesson)),
    );
  }
}
