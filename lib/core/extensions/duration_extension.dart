import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

extension DurationExtension on int {
  String get toHours => '${this ~/ 60} ${LocaleKeys.hours.tr()}';
}
