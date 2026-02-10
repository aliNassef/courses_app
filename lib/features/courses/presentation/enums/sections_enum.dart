import 'package:courses_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum Sections {
  lessons,
  notes,
  discuss,
}

extension SectionsExtension on Sections {
  String get name {
    switch (this) {
      case Sections.lessons:
        return LocaleKeys.lessons.tr();
      case Sections.notes:
        return LocaleKeys.notes.tr();
      case Sections.discuss:
        return LocaleKeys.discuss.tr();
    }
  }
}

extension SectionsMapper on Sections {
  static Sections fromIndex(int index) {
    return Sections.values[index];
  }
}
