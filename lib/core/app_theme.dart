import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/assets.dart';

abstract final class AppTheme {
  static const primaryColor = Color(0xFF200120);
  static const secondaryColor = Color(0xFFFF9900);
  static const white = Color(0xFFFAFAFA);
  static const secondaryTextColor = Color.fromARGB(255, 209, 174, 209);
  static const black = Color(0xFF222222);
  static const grey = Color(0xFFDADADA);

  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      fontFamily: Fonts.dosis.name,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: white,
        secondary: secondaryColor,
        surface: secondaryTextColor,
        onPrimaryContainer: white,
      ),
      scaffoldBackgroundColor: primaryColor,
      textTheme: const TextTheme(
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
      ).apply(
        fontSizeFactor: Screen.fromWindow().isHandset ? 1.3.sp : 0.7.sp,
        fontFamily: context.locale == const Locale('fa') ? Fonts.vazir.name : Fonts.dosis.name,
      ),
    );
  }
}

const _bodyLarge = TextStyle(color: AppTheme.white, fontSize: 16);
const _bodyMedium = TextStyle(color: AppTheme.white, fontSize: 14);
const _bodySmall = TextStyle(color: AppTheme.white, fontSize: 12);

const _titleLarge = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 16);
const _titleMedium = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 14);
const _titleSmall = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 12);
