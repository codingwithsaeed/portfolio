import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/assets.dart';
import 'package:portfolio/core/extensions.dart';
import 'package:x_framework/x_framework.dart';

abstract final class AppTheme {
  static const primaryColor = Color(0xFF200120);
  static const secondaryColor = Color(0xFFFF9900);
  static const white = Color(0xFFFAFAFA);
  static const secondaryTextColor = Color.fromARGB(184, 209, 174, 209);
  static const black = Color(0xFF222222);
  static const grey = Color(0xFFDADADA);

  static ThemeData themeData(BuildContext context) {
    final isMobile = Screen.fromWindow().isHandset;
    final isTablet = Screen.fromWindow().isTablet;

    return ThemeData(
      fontFamily: context.isRtl ? Fonts.vazir.name : Fonts.dosis.name,
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
      appBarTheme: const AppBarTheme(
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
          if (states.contains(MaterialState.selected)) return const IconThemeData(color: white);
          return const IconThemeData(color: Colors.grey);
        }),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return context.titleMedium.copyWith(
              color: secondaryColor,
              fontFamily: context.isRtl ? Fonts.vazir.name : Fonts.dosis.name,
            );
          }
          return context.bodyMedium.copyWith(
            color: Colors.grey,
            fontFamily: context.isRtl ? Fonts.vazir.name : Fonts.dosis.name,
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
          fontFamily: context.isRtl ? Fonts.vazir.name : Fonts.dosis.name,
        ),
        groupAlignment: 0,
        useIndicator: true,
        labelType: NavigationRailLabelType.all,
        unselectedLabelTextStyle: context.bodyMedium.copyWith(
          color: Colors.grey,
          fontFamily: context.isRtl ? Fonts.vazir.name : Fonts.dosis.name,
        ),
      ),
      textTheme: const TextTheme(
              bodyLarge: _bodyLarge,
              bodyMedium: _bodyMedium,
              bodySmall: _bodySmall,
              titleLarge: _titleLarge,
              titleMedium: _titleMedium,
              titleSmall: _titleSmall)
          .apply(
              fontSizeFactor: isMobile
                  ? 1.3.sp
                  : isTablet
                      ? 0.7.sp
                      : 0.5.sp),
    );
  }
}

const _bodyLarge = TextStyle(color: AppTheme.white, fontSize: 16);
const _bodyMedium = TextStyle(color: AppTheme.white, fontSize: 14);
const _bodySmall = TextStyle(color: AppTheme.white, fontSize: 12);

const _titleLarge = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 16);
const _titleMedium = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 14);
const _titleSmall = TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 12);
