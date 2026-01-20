import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

extension DurationExtension on int {
  String get toHours => '${this ~/ 60} ${LocaleKeys.hours.tr()}';
  String get toHM =>
      '${this ~/ 60 ~/ 60} ${LocaleKeys.hours.tr()} ${this % 60} ${LocaleKeys.minutes.tr()}';

  String get toDuration {
    final hours = this ~/ 3600;
    final minutes = (this % 3600) ~/ 60;
    final seconds = this % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
  }
}
