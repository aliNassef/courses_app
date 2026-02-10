import 'package:bloc/bloc.dart';
import 'package:courses_app/core/errors/failure.dart';
import 'package:courses_app/features/courses/data/models/discuss_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/discuss/discussion_repo.dart';

part 'discuss_state.dart';

class DiscussCubit extends Cubit<DiscussState> {
  DiscussCubit(this.repo) : super(DiscussInitial());
  final DiscussionRepo repo;

  void getDiscussions(String courseId) async {
    emit(GetDiscussionsLoading());
    final result = await repo.getDiscussions(courseId);
    result.fold(
      (failure) => emit(GetDiscussionsFailure(failure)),
      (discussions) => emit(GetDiscussionsSuccess(discussions)),
    );
  }

  void addDiscussion(String courseId, DiscussionModel discussion) async {
    List<DiscussionModel> discussions = [];
    if (state is GetDiscussionsSuccess) {
      discussions = (state as GetDiscussionsSuccess).discussions;
      emit(GetDiscussionsSuccess([discussion] + discussions));
    }

    final result = await repo.addDiscussion(courseId, discussion);
    result.fold(
      (failure) {
        emit(GetDiscussionsSuccess(discussions));
        emit(GetDiscussionsFailure(failure));
      },
      (_) {},
    );
  }
}
