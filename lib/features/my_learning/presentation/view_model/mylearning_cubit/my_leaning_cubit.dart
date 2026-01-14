import 'package:bloc/bloc.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:courses_app/features/my_learning/data/model/my_learning_model.dart';
import 'package:courses_app/features/my_learning/data/repo/my_learning_repo.dart';
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

  void updateCourseProgress() {}


  void getLastCourse(String userId) async {
    emit(GetLastLearningCourseLoading());
    final getLastLearningCourseOrFailure = await myLearningRepo
        .getLastLearningCourse(userId);
    getLastLearningCourseOrFailure.fold(
      (failure) => emit(GetLastLearningCourseFailure(failure: failure)),
      (learning) => emit(GetLastLearningCourseSuccess(learning: learning)),
    );
  }
}
