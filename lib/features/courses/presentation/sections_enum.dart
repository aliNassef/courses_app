import 'package:courses_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum Sections {
  notes,
  discuss,
  lessons,
}

extension SectionsExtension on Sections {
  String get name {
    switch (this) {
      case Sections.notes:
        return LocaleKeys.notes.tr();
      case Sections.discuss:
        return LocaleKeys.discuss.tr();
      case Sections.lessons:
        return LocaleKeys.lessons.tr();
    }
  }
}
