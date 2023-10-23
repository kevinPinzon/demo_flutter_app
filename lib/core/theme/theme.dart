import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: Colors.orange[700],
      scaffoldBackgroundColor: Colors.orange[100],
      appBarTheme: AppBarTheme(
        color: Colors.orange[700],
      ),
      cardTheme: CardTheme(
        color: Colors.orange[200],
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          color: Colors.orange[600],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
        ),
      ),
    );
  }
}

const inputDecorationTheme = InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.orange,
      width: 1,
    ),
  ),
);
