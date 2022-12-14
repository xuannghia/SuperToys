import 'package:flutter/material.dart';
import 'package:super_toys/configs/themes/custom_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: CustomColors.sky,
  primarySwatch: CustomColors.sky,
  backgroundColor: Colors.black12,
  splashFactory: NoSplash.splashFactory,
  errorColor: Colors.redAccent.shade200,
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
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColors.sky.shade500, width: 2)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade800, width: 1)),
    filled: true,
    fillColor: Colors.black12,
  ),
  radioTheme: RadioThemeData(
    splashRadius: 0,
    fillColor: MaterialStateProperty.resolveWith(
        (states) => CustomColors.sky.shade600),
  ),
);
