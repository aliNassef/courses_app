// image_picker_helper.dart
import 'dart:io';

abstract class ImagePickerService {
  Future<File?> pickFromCamera();
  Future<File?> pickFromGallery();
}
