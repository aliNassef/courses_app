import 'package:bloc/bloc.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/profile_repo.dart';

part 'user_courses_state.dart';

class UserCoursesCubit extends Cubit<UserCoursesState> {
  UserCoursesCubit(this._repo) : super(UserCoursesInitial());
  final ProfileRepo _repo;

  Future<void> getUserCoursesCount(String userId) async {
    emit(UserCoursesLoading());
    final userCoursesCountOrfailure = await _repo.getUserSubscriptions(userId);
    userCoursesCountOrfailure.fold(
      (failure) => emit(UserCoursesFailure(failure: failure)),
      (count) => emit(UserCoursesSuccess(coursesCount: count)),
    );
  }

  void getUserAchivements(String userId) async {
    final userAchivementsOrfailure = await _repo.getUserAchivements(userId);
    userAchivementsOrfailure.fold(
      (failure) => emit(UserCoursesFailure(failure: failure)),
      (count) {
        final currentState = state;

        if (currentState is UserCoursesSuccess) {
          emit(
            currentState.copyWith(
              coursesCount: currentState.coursesCount!,
              achivementsCount: count,
            ),
          );
        }
      },
    );
  }
}
