import 'package:bloc/bloc.dart';
import 'package:courses_app/features/courses/data/models/review_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repo/review/review_repo.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this._reviewRepo) : super(ReviewInitial());

  final ReviewRepo _reviewRepo;

  void checkShowReview(String courseId, String userId) async {
    final isReviewedOrFailure = await _reviewRepo.hasUserReviewed(
      courseId,
      userId,
    );
    isReviewedOrFailure.fold(
      (failure) => emit(GetReviewFailure(failure)),
      (isReviewed) {
        if (!isReviewed) {
          Future.delayed(const Duration(seconds: 20), () {
            emit(ReviewShouldShow());
          });
        }
      },
    );
  }

  void submitReview(String courseId, ReviewModel reviewModel) async {
    emit(GetReviewLoading());
    final addedOrFailure = await _reviewRepo.addReview(courseId, reviewModel);
    addedOrFailure.fold(
      (failure) => emit(GetReviewFailure(failure)),
      (success) => emit(ReviewSubmitted()),
    );
  }
}
