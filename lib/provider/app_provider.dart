import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class appProvider extends ChangeNotifier {
  String appLanguage = 'en';

  void changeLanguage(String newLanguage) async {
    if (newLanguage == appLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('newLanguage', newLanguage);
  }
}
