import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';
import 'di/locator.dart';
import 'portfolio_app.dart';

void main() async {
  await locateDependencies();
  await ScreenUtil.ensureScreenSize();
  setPathUrlStrategy();
  runApp(const PortfolioApp());
}
