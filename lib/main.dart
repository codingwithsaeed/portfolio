import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'di/locator.dart';
import 'portfolio_app.dart';

void main() async {
  await locateDependencies();
  setPathUrlStrategy();
  runApp(const PortfolioApp());
}
