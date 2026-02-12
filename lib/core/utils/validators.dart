import '../extensions/strings_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import '../translations/locale_keys.g.dart';

class Validators {
  static String? emailValidator(String? value) {
    if (value.isNullOrEmpty) {
      return LocaleKeys.validation_email_required.tr();
    }
    if (!value!.contains('@')) {
      return LocaleKeys.validation_email_invalid.tr();
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value.isNullOrEmpty) {
      return LocaleKeys.validation_password_required.tr();
    }
    if (value!.length < 8) {
      return LocaleKeys.validation_password_length.tr();
    }
    return null;
  }

  static String? fullNameValidator(String? value) {
    if (value.isNullOrEmpty) {
      return LocaleKeys.validation_fullname_required.tr();
    }
    return null;
  }

  static String? fieldIsRequired(String? value) {
    if (value.isNullOrEmpty) {
      return LocaleKeys.validation_fullname_required.tr();
    }
    return null;
  }
}
