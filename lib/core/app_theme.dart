import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/assets.dart';
import 'package:x_framework/x_framework.dart';

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
        background: primaryColor,
        primaryContainer: primaryColor,
        primary: primaryColor,
        onPrimary: white,
        secondary: secondaryColor,
        surface: secondaryTextColor,
        onPrimaryContainer: white,
      ),
      scaffoldBackgroundColor: primaryColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: white),
        iconTheme: IconThemeData(color: white),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: grey.withOpacity(0.05),
        elevation: 0,
        indicatorColor: secondaryColor,
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: white);
          }
          return IconThemeData(color: Colors.grey);
        }),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return context.titleMedium.copyWith(
              color: secondaryColor,
              fontFamily: context.locale == const Locale('fa') ? Fonts.vazir.name : Fonts.dosis.name,
            );
          }
          return context.bodyMedium.copyWith(
            color: Colors.grey,
            fontFamily: context.locale == const Locale('fa') ? Fonts.vazir.name : Fonts.dosis.name,
          );
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: grey.withOpacity(0.05),
        elevation: 0,
        indicatorColor: secondaryColor,
        selectedIconTheme: const IconThemeData(color: white),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelTextStyle: context.titleMedium.copyWith(
          color: secondaryColor,
          fontFamily: context.locale == const Locale('fa') ? Fonts.vazir.name : Fonts.dosis.name,
        ),
        groupAlignment: 0,
        useIndicator: true,
        labelType: NavigationRailLabelType.all,
        unselectedLabelTextStyle: context.bodyMedium.copyWith(
          color: Colors.grey,
          fontFamily: context.locale == const Locale('fa') ? Fonts.vazir.name : Fonts.dosis.name,
        ),
      ),
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
