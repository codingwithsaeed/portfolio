import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_theme.dart';
import 'router.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Theme(
                data: AppTheme.data,
                child: widget!,
              ),
            );
          },
          routerConfig: router,
        );
     
  }
}
