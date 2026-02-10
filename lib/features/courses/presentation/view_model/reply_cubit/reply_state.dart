import 'package:courses_app/features/courses/data/models/reply_model.dart';
import 'package:equatable/equatable.dart';

enum ReplyState { initial, loading, success, failure , addReply }

class ReplyUiState extends Equatable {
  final ReplyModel? replyingTo;
  final String? errorMessage;
  final List<ReplyModel> replies;
  final ReplyState state;
  final String? discussionId;
  const ReplyUiState({
    this.replyingTo,
    this.errorMessage,
    this.replies = const [],
    this.state = ReplyState.initial,
    this.discussionId,
  });

  ReplyUiState copyWith({
    ReplyModel? replyingTo,
    String? errorMessage,
    List<ReplyModel>? replies,
    ReplyState? state,
    String? discussionId,
  }) {
    return ReplyUiState(
      state: state ?? this.state,
      replies: replies ?? this.replies,
      errorMessage: errorMessage ?? this.errorMessage,
      replyingTo: replyingTo,
      discussionId: discussionId,
    );
  }

  @override
  List<Object?> get props => [replyingTo, replies, state, errorMessage, discussionId];
}
