import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: Colors.grey,
      secondary: Colors.black,
    );

    final textTheme = TextTheme(
      titleMedium: TextStyle(
        fontSize: 14,
        color: colorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: colorScheme.secondary,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: colorScheme.primary,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: colorScheme.secondary,
        fontWeight: FontWeight.normal,
      ),
    );

    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
    );
  }
}
