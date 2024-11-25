import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(1, 18, 18, 18),
);

final theme = ThemeData(
  primaryColor: const Color.fromARGB(1, 18, 18, 18),
  colorScheme: kColorScheme,
  scaffoldBackgroundColor: const Color.fromARGB(1, 18, 18, 18),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: const Color.fromARGB(1, 18, 18, 18),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
);
