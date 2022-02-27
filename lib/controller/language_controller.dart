import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {
  /// Internal, private state of the app language
  int _languageId = 2; // defaults to english

  /// Getter method to be accessed in views
  int get currentLanguage => _languageId;

  /// Setter method to alter current app language
  int setLanguage(int langId) {
    _languageId = langId;
    notifyListeners();
    return _languageId;
  }

}
