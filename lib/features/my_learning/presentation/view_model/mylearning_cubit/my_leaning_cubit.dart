import 'package:bloc/bloc.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:courses_app/features/my_learning/data/model/my_learning_model.dart';
import 'package:courses_app/features/my_learning/data/repo/my_learning_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/my_learning_request_model.dart';

part 'my_leaning_state.dart';

class MyLeaningCubit extends Cubit<MyLeaningState> {
  MyLeaningCubit(this.myLearningRepo) : super(MyLeaningInitial());
  final MyLearningRepo myLearningRepo;

  void getAllLearning(String userId) async {
    emit(MyLeaningLoading());
    final getMyLearningCoursesOrFailure = await myLearningRepo
        .getMyLearningCourses(userId);
    getMyLearningCoursesOrFailure.fold(
      (failure) => emit(MyLeaningFailure(failure: failure)),
      (learning) => emit(MyLeaningSuccess(learning: learning)),
    );
  }

  void addCourseToLearning(
    MyLearningRequestModel myLearningRequestModel,
  ) async {
    emit(AddCourseToMyLeaningLoading());
    final addCourseToMyLearningOrFailure = await myLearningRepo
        .addCourseToMyLearning(
          myLearningRequestModel,
        );
    addCourseToMyLearningOrFailure.fold(
      (failure) => emit(AddCourseToMyLeaningFailure(failure: failure)),
      (success) => emit(AddCourseToMyLeaningSuccess()),
    );
  }

  void updateCourseProgress() {}
}
