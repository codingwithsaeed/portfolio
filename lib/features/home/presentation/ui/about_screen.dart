import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:portfolio/assets.dart';
import 'package:x_framework/x_framework.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: XText(TKey.about.name.tr()),
      ),
      body: AdaptiveBuilder(
        defaultBuilder: (context, screen) => _buildDesktop(context, screen),
        layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
          desktop: (context, screen) => _buildDesktop(context, screen),
          tablet: (context, screen) => _buildTablet(context, screen),
          handset: (context, screen) => _buildHandset(context, screen),
        ),
      ),
    );
  }
}

Widget _buildDesktop(BuildContext context, Screen screen) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
    ],
  );
}

Widget _buildTablet(BuildContext context, Screen screen) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
    ],
  );
}

Widget _buildHandset(BuildContext context, Screen screen) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      
    ],
  );
}
