import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:courses_app/core/di/di.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/errors/failure.dart' show Failure;
import '../../../../../core/services/image_picker/image_picker_service.dart';
import '../../../../../core/services/storage/storage_service.dart';

part 'update_user_profile_image_state.dart';

class UpdateUserProfileImageCubit extends Cubit<UpdateUserProfileImageState> {
  UpdateUserProfileImageCubit(
    this._repo,
    this._imagePickerService,
    this._storageService,
  ) : super(UpdateUserProfileImageInitial());
  final ProfileRepo _repo;
  final ImagePickerService _imagePickerService;
  final StorageService _storageService;

  void updateProfileImage(String userId) async {
    if (state is PickedUserProfileImage) {
      final image = (state as PickedUserProfileImage).image;
      emit(UpdateUserProfileImageLoading());

      final imageUrlOrFailure = await _storageService.uploadImage(
        file: image,
        path: '${Constants.profileImagesPath}/$userId',
      );
      imageUrlOrFailure.fold(
        (failure) => emit(UpdateUserProfileImageFailure(failure: failure)),
        (imageUrl) async {
          final updateOrFailure = await _repo.updateProfileImage(
            userId,
            imageUrl,
          );
          updateOrFailure.fold(
            (failure) => emit(UpdateUserProfileImageFailure(failure: failure)),
            (_) => emit(UpdateUserProfileImageSuccess(imageUrl: imageUrl)),
          );
        },
      );
    }
  }

  void pickImage() async {
    final image = await _imagePickerService.pickFromGallery();
    if (image != null) {
      emit(PickedUserProfileImage(image: image));
    }
  }
}
