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
    emit(
      AddCourseToWishlistSuccess(
        wishlist.courseId,
      ),
    );
    final addedOrFailed = await _wishlistRepo.addCourseToWishlist(
      userId,
      wishlist,
    );

    addedOrFailed.fold(
      (failure) => emit(AddCourseToWishlistError(failure)),
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
}
