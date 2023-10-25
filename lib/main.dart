import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart' show usePathUrlStrategy;
import 'package:go_router/go_router.dart';
import 'di/locator.dart';
import 'portfolio_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await locateDependencies();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('fa')],
      path: 'assets/translations',
      startLocale: const Locale('fa'),
      fallbackLocale: const Locale('en'),
      child: const PortfolioApp(),
    ),
  );
}
