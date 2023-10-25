import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/extensions.dart';
import 'package:portfolio/features/home/presentation/store/home_ui_store.dart';
import 'package:provider/provider.dart';
import 'core/app_theme.dart';
import 'router.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (_) => HomeUiStore(context)),
        ],
        builder: (context, widget) {
          return Breakpoint(
            child: ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return MaterialApp.router(
                    theme: AppTheme.themeData(context),
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    debugShowCheckedModeBanner: false,
                    builder: (context, widget) {
                      return MediaQuery(
                        data: context.mediaQuery.copyWith(textScaleFactor: 1.0),
                        child: widget!,
                      );
                    },
                    routerConfig: router,
                  );
                }),
          );
        });
  }
}
