part of 'like_discuss_cubit.dart';

sealed class LikeDiscussState extends Equatable {
  const LikeDiscussState();

  @override
  List<Object> get props => [];
}

final class LikeDiscussInitial extends LikeDiscussState {}

final class ToggleLikeLoading extends LikeDiscussState {}

final class ToggleLikeSuccess extends LikeDiscussState {
  final Set<String> ids;
  const ToggleLikeSuccess(this.ids);
  @override
  List<Object> get props => [ids];
}

final class ToggleLikeFailure extends LikeDiscussState {
  final Failure failure;
  const ToggleLikeFailure(this.failure);
  @override
  List<Object> get props => [failure];
}
