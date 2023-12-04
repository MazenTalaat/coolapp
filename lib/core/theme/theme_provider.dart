import 'package:coolapp/core/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appThemeStateNotifier =
    ChangeNotifierProvider<AppThemeState>((ref) => AppThemeState());

class AppThemeState extends ChangeNotifier {
  final SharedPreferences prefs = locator.get<SharedPreferences>();
  var isDarkModeEnabled =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  AppThemeState() {
    if (prefs.getBool('isDark') != null) {
      isDarkModeEnabled = prefs.getBool('isDark') ?? false;
    }
  }

  void setLightTheme() {
    isDarkModeEnabled = false;
    prefs.setBool('isDark', false);
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    prefs.setBool('isDark', true);
    notifyListeners();
  }
}
