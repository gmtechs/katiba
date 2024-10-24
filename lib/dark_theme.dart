import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
        displayLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.blueGrey,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ), colorScheme: const ColorScheme.dark(
        primary: Colors.blueGrey,
        secondary: Colors.lightBlueAccent,
        background: Colors.black,
        surface: Colors.grey,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      ).copyWith(background: Colors.black),
      // Add more theme customization as needed
    );
  }
}
