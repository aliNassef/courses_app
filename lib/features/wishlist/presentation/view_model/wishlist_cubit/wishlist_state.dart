part of 'wishlist_cubit.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class WishlistLoaded extends WishlistState {
  final List<CourseModel> courses;
  const WishlistLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}

final class WishlistError extends WishlistState {
  final Failure failure;
  const WishlistError(this.failure);

  @override
  List<Object> get props => [failure];
}

final class AddOrRemoveCourseFromWishlistSuccess extends WishlistState {
  final Set<String> ids;
  const AddOrRemoveCourseFromWishlistSuccess(this.ids);

  @override
  List<Object> get props => [ids];
}

final class AddCourseToWishlistError extends WishlistState {
  final Failure failure;
  const AddCourseToWishlistError(this.failure);

  @override
  List<Object> get props => [failure];
}
