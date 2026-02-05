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

  void getReplies(String courseId, String discussionId) async {
    emit(GetRepliesLoading());
    final result = await repo.getReplies(courseId, discussionId);
    result.fold(
      (failure) => emit(GetRepliesFailure(failure)),
      (replies) => emit(GetRepliesSuccess(replies)),
    );
  }

  void addReplyToDiscussion(
    String courseId,
    String discussionId,
    ReplyModel reply,
  ) async {
    emit(AddReplyToDiscussionLoading());
    final result = await repo.addReplyToDiscussion(
      courseId: courseId,
      discussionId: discussionId,
      reply: reply,
    );
    result.fold(
      (failure) => emit(AddReplyToDiscussionFailure(failure)),
      (_) => emit(const AddReplyToDiscussionSuccess()),
    );
  }

  void addDiscussion(String courseId, DiscussionModel discussion) async {
    emit(AddDiscussionLoading());
    final result = await repo.addDiscussion(courseId, discussion);
    result.fold(
      (failure) => emit(AddDiscussionFailure(failure)),
      (_) => emit(const AddDiscussionSuccess()),
    );
  }
}
