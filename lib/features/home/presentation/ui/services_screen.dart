import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:portfolio/features/home/presentation/ui/common_app_bar.dart';
import 'package:x_framework/x_framework.dart';
import 'package:portfolio/core/extensions.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonInScreen(
      title: context.l10n.services,
      child: AdaptiveBuilder(
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      XCenterText(text: context.l10n.services),
    ],
  );
}

Widget _buildTablet(BuildContext context, Screen screen) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      XCenterText(text: context.l10n.services),
    ],
  );
}

Widget _buildHandset(BuildContext context, Screen screen) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      XCenterText(text: context.l10n.services),
    ],
  );
}
