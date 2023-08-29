import 'package:go_router/go_router.dart';

import 'features/home/presentation/ui/home_screen.dart';
import 'features/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen(), routes: [
      GoRoute(
        path: 'portfolio',
        builder: (context, state) => const HomeScreen(),
      )
    ]),
  ],
);
