import 'package:flutter/material.dart';
import 'package:flutter_music_player/themes/dark_mode.dart';
import 'package:flutter_music_player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Light mode at the start
  ThemeData _themeData = lightMode;

  // Get theme
  ThemeData get themeData => _themeData;

  // Bool for dark mode
  bool get isDarkMode => _themeData == darkMode;

  // Set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    // Update UI
    notifyListeners();
  }

  // Toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
    notifyListeners();
  }
}
