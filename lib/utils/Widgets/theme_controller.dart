import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController implements GetxService {


  static const _themeKey = 'isDarkMode';

  Rx<ThemeMode> themeMode = ThemeMode.light.obs;
var isDarkMode = false.obs;
  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPrefs();
  }

  void toggleTheme() {
    final isDark = themeMode.value == ThemeMode.dark;
    isDarkMode.value = !isDark; // Toggle the observable
    themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark;
    _saveThemeToPrefs(!isDark); // Save the new value
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey) ?? false;
    isDarkMode.value = isDark;
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> _saveThemeToPrefs(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

}



