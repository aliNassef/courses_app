// image_picker_helper_impl.dart
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import '../../errors/failure.dart';
import 'image_picker_service.dart';

class ImagePickerServiceImpl implements ImagePickerService {
  final ImagePicker _picker;

  ImagePickerServiceImpl(
    this._picker,
  );

  @override
  Future<File?> pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );
      if (image == null) return null;
      return File(image.path);
    } on Exception catch (e) {
      throw Failure(errMessage: e.toString());
    }
  }

  @override
  Future<File?> pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image == null) return null;
      return File(image.path);
    } on Exception catch (e) {
      throw Failure(errMessage: e.toString());
    }
  }
}
