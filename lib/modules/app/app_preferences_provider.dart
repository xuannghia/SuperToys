import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:super_toys/modules/app/app_preferences_keys.dart';

class AppPreferenceNotifier extends ChangeNotifier {
  ThemeMode themeMode;

  final _localStorage = Hive.box(AppPreferencesKeys.boxKey);

  ThemeMode _loadThemeFromBox() =>
      ThemeMode.values[_localStorage.get(AppPreferencesKeys.themeMode) ?? 0];
  _saveThemeToBox(int modeIndex) =>
      _localStorage.put(AppPreferencesKeys.themeMode, modeIndex);

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    _saveThemeToBox(mode.index);
    notifyListeners();
  }

  AppPreferenceNotifier({required this.themeMode}) {
    ThemeMode mode = _loadThemeFromBox();
    setThemeMode(mode);
  }
}

final appPreferencesProvider = ChangeNotifierProvider(
  (_) => AppPreferenceNotifier(
    themeMode: ThemeMode.system,
  ),
);
