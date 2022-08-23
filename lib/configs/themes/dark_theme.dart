import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  backgroundColor: Colors.black12,
  splashFactory: NoSplash.splashFactory,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade800, width: 1)),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 1)),
    filled: true,
    fillColor: Colors.black12,
  ),
);
