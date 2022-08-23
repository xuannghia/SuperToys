import 'package:flutter/material.dart';
import 'package:super_toys/configs/themes/custom_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: CustomColors.sky,
  primarySwatch: CustomColors.sky,
  backgroundColor: Colors.black12,
  splashFactory: NoSplash.splashFactory,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
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
  radioTheme: const RadioThemeData(splashRadius: 0),
);
