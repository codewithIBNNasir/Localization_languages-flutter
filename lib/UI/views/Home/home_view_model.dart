import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_constants.dart';

class HomeViewModel extends BaseViewModel {
  Locale _currentLocale = const Locale('en');
  int _currentLanguageIndex = 0;

  Locale get currentLocale => _currentLocale;
  int get currentLanguageIndex => _currentLanguageIndex;

  Map<String, dynamic> get currentLanguageData =>
      AppStrings.languages[_currentLanguageIndex];

  bool get isRtl => _currentLocale.languageCode == 'ur';

  bool _isAvatarHovered = false;
  bool get isAvatarHovered => _isAvatarHovered;

  bool _skillsVisible = false;
  bool get skillsVisible => _skillsVisible;

  void init() {
    Future.delayed(const Duration(milliseconds: 600), () {
      _skillsVisible = true;
      notifyListeners();
    });
  }

  void cycleLanguage() {
    _currentLanguageIndex =
        (_currentLanguageIndex + 1) % AppStrings.languages.length;
    _currentLocale =
        AppStrings.languages[_currentLanguageIndex]['locale'] as Locale;
    notifyListeners();
  }

  void selectLanguage(int index) {
    if (_currentLanguageIndex == index) return;
    _currentLanguageIndex = index;
    _currentLocale =
        AppStrings.languages[index]['locale'] as Locale;
    notifyListeners();
  }

 void setAvatarHovered(bool value) {
    _isAvatarHovered = value;
    notifyListeners();
  }
}