import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repo/discuss/discussion_repo.dart';

part 'like_discuss_state.dart';

class LikeDiscussCubit extends Cubit<LikeDiscussState> {
  LikeDiscussCubit(this.repo) : super(LikeDiscussInitial());
  final DiscussionRepo repo;

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
