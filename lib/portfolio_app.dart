import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/extensions.dart';
import 'core/app_theme.dart';
import 'router.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, widget) {
          return MaterialApp.router(
            theme: AppTheme.data,
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(
                data: context.mediaQuery.copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            routerConfig: router,
          );
        });
  }
}
