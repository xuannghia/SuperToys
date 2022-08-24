import 'package:flutter/material.dart';
import 'package:super_toys/configs/themes/custom_colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: CustomColors.sky,
  primarySwatch: CustomColors.sky,
  splashFactory: NoSplash.splashFactory,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.grey.shade50,
  errorColor: Colors.redAccent,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: CustomColors.sky.shade600, width: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColors.sky.shade500, width: 2)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
    filled: true,
    fillColor: Colors.grey.shade100,
  ),
  radioTheme: const RadioThemeData(splashRadius: 0),
);
