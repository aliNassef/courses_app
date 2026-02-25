part of 'update_user_profile_image_cubit.dart';

sealed class UpdateUserProfileImageState extends Equatable {
  const UpdateUserProfileImageState();

  @override
  List<Object> get props => [];
}

final class UpdateUserProfileImageInitial extends UpdateUserProfileImageState {}

final class UpdateUserProfileImageLoading extends UpdateUserProfileImageState {}
final class PickedUserProfileImage extends UpdateUserProfileImageState {
  final File image;
  const PickedUserProfileImage({required this.image});

  @override
  List<Object> get props => [image];
}

final class UpdateUserProfileImageSuccess extends UpdateUserProfileImageState {
  final String imageUrl;
  const UpdateUserProfileImageSuccess({required this.imageUrl});

  @override
  List<Object> get props => [imageUrl];
}

final class UpdateUserProfileImageFailure extends UpdateUserProfileImageState {
  final Failure failure;
  const UpdateUserProfileImageFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
