import 'package:bloc/bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/model/my_learning_model.dart';
import '../../../data/model/progress_request_model.dart';
import '../../../data/repo/my_learning_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/my_learning_request_model.dart';

part 'my_leaning_state.dart';

class MyLearningCubit extends Cubit<MyLearningState> {
  MyLearningCubit(this.myLearningRepo) : super(MyLearningInitial());
  final MyLearningRepo myLearningRepo;

  void getAllLearning(String userId) async {
    emit(MyLearningLoading());
    final getMyLearningCoursesOrFailure = await myLearningRepo
        .getMyLearningCourses(userId);
    getMyLearningCoursesOrFailure.fold(
      (failure) => emit(MyLearningFailure(failure: failure)),
      (learning) => emit(MyLearningSuccess(learning: learning)),
    );
  }

  void addCourseToLearning(
    MyLearningRequestModel myLearningRequestModel,
  ) async {
    emit(AddCourseToMyLearningLoading());
    final addCourseToMyLearningOrFailure = await myLearningRepo
        .addCourseToMyLearning(
          myLearningRequestModel,
        );
    addCourseToMyLearningOrFailure.fold(
      (failure) => emit(AddCourseToMyLearningFailure(failure: failure)),
      (success) => emit(AddCourseToMyLearningSuccess()),
    );
  }

  void updateCourseProgress(ProgressRequestModel progressRequestModel) async {
    emit(UpdateCourseProgressSuccess());
    final updateCourseProgressOrFailure = await myLearningRepo.updateProgress(
      progressRequestModel,
    );
    updateCourseProgressOrFailure.fold(
      (failure) => emit(UpdateCourseProgressFailure(failure: failure)),
      (success) {},
    );
  }

  void getLastCourse(String userId) async {
    emit(GetLastLearningCourseLoading());
    final getLastLearningCourseOrFailure = await myLearningRepo
        .getLastLearningCourse(userId);
    getLastLearningCourseOrFailure.fold(
      (failure) => emit(GetLastLearningCourseFailure(failure: failure)),
      (learning) => emit(GetLastLearningCourseSuccess(learning: learning)),
    );
  }

  void getCompletedLessonsIds({
    required String userId,
    required String courseId,
  }) async {
    emit(GetCompletedLessonsIdsLoading());
    final lessonsIdsOrFailure = await myLearningRepo.getCompletedLessonsIds(
      userId: userId,
      courseId: courseId,
    );
    lessonsIdsOrFailure.fold(
      (failure) => emit(GetCompletedLessonsIdsError(failure: failure)),
      (lessonsIds) =>
          emit(GetCompletedLessonsIdsSuccess(lessonsIds: lessonsIds)),
    );
  }
}
