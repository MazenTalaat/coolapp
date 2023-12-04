import 'package:coolapp/core/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appLocaleStateNotifier =
ChangeNotifierProvider<AppLocaleState>((ref) => AppLocaleState());

class AppLocaleState extends ChangeNotifier {
  final SharedPreferences prefs = locator.get<SharedPreferences>();
  var lang = 'en';

  AppLocaleState() {
    if (prefs.getString('lang') != null) {
      lang = prefs.getString('lang')??'en';
    }
  }

  void setLocale(l) {
    lang = l;
    prefs.setString('lang', l);
    notifyListeners();
  }

}