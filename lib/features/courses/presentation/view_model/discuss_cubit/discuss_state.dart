part of 'discuss_cubit.dart';

sealed class DiscussState extends Equatable {
  const DiscussState();

  @override
  List<Object> get props => [];
}

final class DiscussInitial extends DiscussState {}

final class GetDiscussionsLoading extends DiscussState {}

final class GetDiscussionsSuccess extends DiscussState {
  final List<DiscussionModel> discussions;

  const GetDiscussionsSuccess(this.discussions);

  @override
  List<Object> get props => [discussions];
}

final class GetDiscussionsFailure extends DiscussState {
  final Failure failure;

  const GetDiscussionsFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

final class GetRepliesLoading extends DiscussState {}

final class GetRepliesSuccess extends DiscussState {
  final List<ReplyModel> replies;

  const GetRepliesSuccess(this.replies);

  @override
  List<Object> get props => [replies];
}

final class GetRepliesFailure extends DiscussState {
  final Failure failure;

  const GetRepliesFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

final class AddReplyToDiscussionLoading extends DiscussState {}

final class AddReplyToDiscussionSuccess extends DiscussState {
  const AddReplyToDiscussionSuccess();

  @override
  List<Object> get props => [];
}

final class AddReplyToDiscussionFailure extends DiscussState {
  final Failure failure;

  const AddReplyToDiscussionFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

final class AddDiscussionLoading extends DiscussState {}

final class AddDiscussionSuccess extends DiscussState {
  const AddDiscussionSuccess();

  @override
  List<Object> get props => [];
}

final class AddDiscussionFailure extends DiscussState {
  final Failure failure;

  const AddDiscussionFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
