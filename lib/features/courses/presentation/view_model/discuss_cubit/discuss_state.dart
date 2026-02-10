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

 

final class ToggleLikeSuccess extends DiscussState {
  final Set<String> ids;
  const ToggleLikeSuccess(this.ids);

  ToggleLikeSuccess copyWith({Set<String>? ids}) {
    return ToggleLikeSuccess(ids ?? this.ids);
  }

  @override
  List<Object> get props => [ids];
}

final class ToggleLikeLoading extends DiscussState {}

final class ToggleLikeFailure extends DiscussState {
  final Failure failure;
  const ToggleLikeFailure(this.failure);
  @override
  List<Object> get props => [failure];
}
