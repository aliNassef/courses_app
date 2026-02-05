import 'package:bloc/bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../courses/data/models/course_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/wishlist_model.dart';
import '../../../data/repo/wishlist_repo.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this._wishlistRepo) : super(WishlistInitial());
  final WishlistRepo _wishlistRepo;

  void addToWishlist(String userId, WishlistModel wishlist) async {
    final previousIds = state is AddOrRemoveCourseFromWishlistSuccess
        ? Set<String>.from((state as AddOrRemoveCourseFromWishlistSuccess).ids)
        : <String>{};

    final updatedIds = Set<String>.from(previousIds)..add(wishlist.courseId);

    emit(AddOrRemoveCourseFromWishlistSuccess(updatedIds));

    final addCourseToWishlistOrfailure = await _wishlistRepo
        .addCourseToWishlist(
          userId,
          wishlist,
        );

    addCourseToWishlistOrfailure.fold(
      (failure) {
        emit(AddOrRemoveCourseFromWishlistSuccess(previousIds));
        emit(AddCourseToWishlistError(failure));
      },
      (_) {},
    );
  }

  void getWishlistCourses(String userId) async {
    emit(WishlistLoading());
    final wishlistCoursesOrFailure = await _wishlistRepo.getWishlistCourses(
      userId,
    );
    wishlistCoursesOrFailure.fold(
      (failure) => emit(WishlistError(failure)),
      (courses) => emit(WishlistLoaded(courses)),
    );
  }

  void removeFromWishlist(String userId, String courseId) async {
    final previousIds = state is AddOrRemoveCourseFromWishlistSuccess
        ? Set<String>.from((state as AddOrRemoveCourseFromWishlistSuccess).ids)
        : <String>{};

    final updatedIds = Set<String>.from(previousIds)..remove(courseId);

    emit(AddOrRemoveCourseFromWishlistSuccess(updatedIds));

    final removeCourseFromWishlistOrfailure = await _wishlistRepo
        .removeCourseFromWishlist(
          userId,
          courseId,
        );

    removeCourseFromWishlistOrfailure.fold(
      (failure) {
        emit(AddOrRemoveCourseFromWishlistSuccess(previousIds));
        emit(AddCourseToWishlistError(failure));
      },
      (_) {},
    );
  }
}
