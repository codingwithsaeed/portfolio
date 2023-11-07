import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart' show usePathUrlStrategy;
import 'package:go_router/go_router.dart';
import 'di/locator.dart';
import 'portfolio_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locateDependencies();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const PortfolioApp());
}
