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
