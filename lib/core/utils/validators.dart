import 'package:courses_app/core/extensions/strings_extensions.dart';

class Validators {
  static String? emailValidator(String? value) {
    if (value.isNullOrEmpty) {
      return 'Email is required';
    }
    if (!value!.contains('@')) {
      return 'Email must contain @';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value.isNullOrEmpty) {
      return 'Password is required';
    }
    if (value!.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? fullNameValidator(String? value) {
    if (value.isNullOrEmpty) {
      return 'Full name is required';
    }
    return null;
  }
}
