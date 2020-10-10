import 'package:dar_sudan/config/storage_manager.dart';
import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  static const localeValueList = ['ar', 'en'];

  //
  static const kLocaleIndex = 'kLocaleIndex';

  int _localeIndex;

  int get localeIndex => _localeIndex;

  Locale get locale {
    var value = localeValueList[_localeIndex].split("-");
    return Locale(value[0], value.length == 2 ? value[1] : '');
  }

  LocaleModel() {
    _localeIndex = StorageManager.sharedPreferences.getInt(kLocaleIndex) ?? 0;
  }

  switchLocale() {
    _localeIndex = 1 - _localeIndex;
    notifyListeners();
    StorageManager.sharedPreferences.setInt(kLocaleIndex, _localeIndex);
  }

  static String localeName(index, context) {
    switch (index) {
      case 0:
        return 'Arabic';
      case 1:
        return 'English';
      default:
        return '';
    }
  }
}
