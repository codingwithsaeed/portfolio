import 'package:flutter/material.dart';
import 'di/locator.dart';
import 'portfolio_app.dart';

void main() async {
  await locateDependencies();
  runApp(const PortfolioApp());
}
