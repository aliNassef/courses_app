import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/chapter_model.dart';
import '../../../data/models/lesson_model.dart';
import '../../../data/repo/courses_repo.dart';
import '../../sections_enum.dart';

part 'course_watch_state.dart';

class CourseWatchCubit extends Cubit<CourseWatchState> {
  CourseWatchCubit(this.repo) : super(CourseWatchInitial());
  final CoursesRepo repo;
  Future<void> init(String courseId, String userId) async {
    emit(GetSpecificLessonLoading());
    final lessonsOrFailure = await repo.getLastLessonWatched(courseId, userId);
    lessonsOrFailure.fold(
      (failure) => emit(GetSpecificLessonError(failure: failure)),
      (lesson) => emit(GetSpecificLessonSuccess(lesson: lesson)),
    );
  }

  void getChaptersByCourseId(String courseId) async {
    emit(GetChaptersByCourseIdLoading());
    final chaptersOrFailure = await repo.getChaptersByCourseId(courseId);
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
    final lessonsOrFailure = await repo.getLessonsByCourseIdAndLessonId(
      courseId,
      lessonId,
    );
    lessonsOrFailure.fold(
      (failure) => emit(GetSpecificLessonError(failure: failure)),
      (lesson) => emit(GetSpecificLessonSuccess(lesson: lesson)),
    );
  }

  Future<void> onTapSections(Sections section) async {
    if (section == Sections.lessons) {
      emit(ShowLessons());
    } else if (section == Sections.discuss) {
      emit(ShowDiscuss());
    } else if (section == Sections.notes) {
      emit(ShowNotes());
    } else {
      emit(ShowLessons());
    }
  }
}
