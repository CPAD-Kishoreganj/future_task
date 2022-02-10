import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(
      secondary: Colors.grey,
      onPrimary: Colors.grey,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 197, 4, 4),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(
      secondary: Color.fromARGB(255, 238, 176, 84),
      onPrimary: Color.fromARGB(255, 26, 199, 69),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}
