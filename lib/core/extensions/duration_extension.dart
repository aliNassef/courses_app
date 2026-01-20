import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

extension DurationExtension on int {
  String get toHours => '${this ~/ 60} ${LocaleKeys.hours.tr()}';
  String get toHM =>
      '${this ~/ 60 ~/ 60} ${LocaleKeys.hours.tr()} ${this % 60} ${LocaleKeys.minutes.tr()}';

  String get toDuration {
    final duration = Duration(minutes: this);
    return duration.toString().split('.').first.padLeft(8, '0');
  }
}
