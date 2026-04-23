import 'package:flutter/material.dart';
import 'colors.dart';

abstract class AppTheme {
  static ThemeData appTeme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.p1,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.p4,
      iconTheme: IconThemeData(color: AppColors.p1),
      titleTextStyle: TextStyle(
        color: AppColors.p1,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.p4,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: AppColors.p3, fontSize: 14),
      labelMedium: TextStyle(color: AppColors.p3, fontSize: 16),
    ),
    primaryTextTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.p3,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: AppColors.p3, fontSize: 14),
      labelMedium: TextStyle(color: AppColors.p3, fontSize: 16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.p2)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.p3),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.p4, width: 2.0),
      ),
      labelStyle: TextStyle(color: AppColors.p4),
      hintStyle: TextStyle(color: AppColors.p3),
      fillColor: AppColors.p4,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.p1),
        backgroundColor: WidgetStateProperty.fromMap({
          WidgetState.pressed: AppColors.p4,
          WidgetState.hovered: AppColors.p2,
          WidgetState.disabled: AppColors.t1,
          WidgetState.any: AppColors.p3,
        }),
        elevation: WidgetStatePropertyAll(8.0),
      ),
    ),
    canvasColor: AppColors.p2,
  );
}
