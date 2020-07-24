import 'package:flutter/material.dart';
import 'package:profe_case_study/core/init/theme/app_theme_light.dart';

enum AppThemes { LIGHT, DARK }

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeTheme(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeLight.instance.theme;
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
