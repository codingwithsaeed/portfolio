import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/home/presentation/ui/home_screen.dart';
import 'features/home/presentation/ui/about_screen.dart';
import 'features/splash/splash_screen.dart';

enum Routes {
  splash,
  portfolio,
  about,
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.splash.name,
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'portfolio',
          name: Routes.portfolio.name,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'about',
              name: Routes.about.name,
              pageBuilder: (context, state) => const MaterialPage(fullscreenDialog: true, child: AboutScreen()),
            )
          ],
        )
      ],
    ),
  ],
);
