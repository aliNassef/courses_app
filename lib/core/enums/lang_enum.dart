import '../constants/constants.dart';

enum LangEnum {
  en,
  ar
  ;

  String get value {
    switch (this) {
      case LangEnum.en:
        return Constants.en;
      case LangEnum.ar:
        return Constants.ar;
    }
  }
}
