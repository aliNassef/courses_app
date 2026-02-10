import 'package:bloc/bloc.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:courses_app/features/courses/data/models/discuss_model.dart';
import 'package:courses_app/features/courses/data/repo/courses_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/reply_model.dart';

part 'discuss_state.dart';

class DiscussCubit extends Cubit<DiscussState> {
  DiscussCubit(this.repo) : super(DiscussInitial());
  final CoursesRepo repo;

  void getDiscussions(String courseId) async {
    emit(GetDiscussionsLoading());
    final result = await repo.getDiscussions(courseId);
    result.fold(
      (failure) => emit(GetDiscussionsFailure(failure)),
      (discussions) => emit(GetDiscussionsSuccess(discussions)),
    );
  }

  void addDiscussion(String courseId, DiscussionModel discussion) async {
    List<DiscussionModel> discussions = [];
    if (state is GetDiscussionsSuccess) {
      discussions = (state as GetDiscussionsSuccess).discussions;
      emit(GetDiscussionsSuccess([discussion] + discussions));
    }

    final result = await repo.addDiscussion(courseId, discussion);
    result.fold(
      (failure) {
        emit(GetDiscussionsSuccess(discussions));
        emit(GetDiscussionsFailure(failure));
      },
      (_) {},
    );
  }

  void toggleLike(String courseId, String discussionId, String userId) async {
    final oldId = state is ToggleLikeSuccess
        ? Set<String>.from((state as ToggleLikeSuccess).ids)
        : <String>{};
    Set<String> newId = Set<String>.from(oldId);

    if (newId.contains(discussionId)) {
      newId.remove(discussionId);
    } else {
      newId.add(discussionId);
    }

    emit(ToggleLikeSuccess(newId));

    final toggledLikeOrFailure = await repo.toggleLike(
      courseId,
      discussionId,
      userId,
    );

    toggledLikeOrFailure.fold(
      (failure) {
        emit(ToggleLikeSuccess(oldId));
        emit(ToggleLikeFailure(failure));
      },
      (_) {},
    );
  }

  void loadMyLikes(String courseId, String userId) async {
    emit(ToggleLikeLoading());
    final result = await repo.getMyLikedDiscussions(
      courseId: courseId,
      userId: userId,
    );
    result.fold(
      (failure) => emit(ToggleLikeFailure(failure)),
      (likes) => emit(ToggleLikeSuccess(likes)),
    );
  }
}
