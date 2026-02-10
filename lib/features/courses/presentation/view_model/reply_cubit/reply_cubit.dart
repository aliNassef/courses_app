import 'package:bloc/bloc.dart';
import 'package:courses_app/features/courses/data/models/reply_model.dart';
import 'package:courses_app/features/courses/data/repo/courses_repo.dart';

import 'reply_state.dart';

class ReplyCubit extends Cubit<ReplyUiState> {
  ReplyCubit(this._coursesRepo) : super(const ReplyUiState());
  final CoursesRepo _coursesRepo;

  void prepareReply(
    String discussionId,
    ReplyModel reply,
  ) async {
    emit(
      state.copyWith(
        state: ReplyState.addReply,
        discussionId: discussionId,
        replyingTo: reply,
      ),
    );
  }

  void addReply(String courseId, String discussionId, ReplyModel reply) async {
    emit(
      state.copyWith(
        state: ReplyState.success,
        discussionId: discussionId,
        replyingTo: reply,
        replies: [
          reply,
          ...state.replies,
        ],
      ),
    );
    final addReplyOrfailure = await _coursesRepo.addReplyToDiscussion(
      courseId: courseId,
      discussionId: discussionId,
      reply: reply,
    );

    addReplyOrfailure.fold(
      (failure) {
        final updatedReplies = List<ReplyModel>.from(state.replies)
          ..remove(reply);
        emit(
          state.copyWith(
            replies: updatedReplies,
            state: ReplyState.failure,
          ),
        );
      },
      (_) {},
    );
  }

  void cancelReply() {
    emit(state.copyWith(state: ReplyState.initial));
  }

  void getReplies(String courseId, String discussionId) async {
    emit(
      state.copyWith(
        state: ReplyState.loading,
        discussionId: discussionId,
        replies: [],
      ),
    );
    final getRepliesOrfailure = await _coursesRepo.getReplies(
      courseId,
      discussionId,
    );

    getRepliesOrfailure.fold(
      (failure) {
        emit(
          state.copyWith(
            state: ReplyState.failure,
            errorMessage: failure.errMessage,
            discussionId: discussionId,
          ),
        );
      },
      (replies) {
        emit(
          state.copyWith(
            state: ReplyState.success,
            replies: replies,
            discussionId: discussionId,
          ),
        );
      },
    );
  }
}
