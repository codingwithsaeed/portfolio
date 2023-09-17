import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/assets.dart';

abstract final class AppTheme {
  static const primaryColor = Color(0xFF200120);
  static const secondaryColor = Color(0xFFFF9900);
  static const white = Color(0xFFFAFAFA);
  static const secondaryTextColor = Color.fromARGB(255, 213, 189, 213);
  static const black = Color(0xFF222222);
  static const grey = Color(0xFFDADADA);

  static ThemeData get data {
    return ThemeData(
      fontFamily: Fonts.dosis.name,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: white,
        secondary: secondaryColor,
        tertiary: secondaryTextColor,
      ),
      scaffoldBackgroundColor: primaryColor,
      textTheme:  TextTheme(
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
      ),
    );
  }
}

final _bodyLarge = TextStyle(color: AppTheme.white, fontSize: 16.spMin);
final _bodyMedium = TextStyle(color: AppTheme.white, fontSize: 14.spMin);
final _bodySmall = TextStyle(color: AppTheme.white, fontSize: 13.spMin);

final _titleLarge = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 16.spMin);
final _titleMedium = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 14.spMin);
final _titleSmall = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 13.spMin);
