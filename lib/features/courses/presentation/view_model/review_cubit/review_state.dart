part of 'review_cubit.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

final class ReviewInitial extends ReviewState {}

final class GetReviewLoading extends ReviewState {}

final class ReviewShouldShow extends ReviewState {}

class ReviewSubmitted extends ReviewState {}

final class GetReviewSuccess extends ReviewState {
  final bool isReviewed;
  const GetReviewSuccess(this.isReviewed);

  @override
  List<Object> get props => [isReviewed];
}

final class GetReviewFailure extends ReviewState {
  final Failure failure;
  const GetReviewFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
