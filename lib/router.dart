import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/home/presentation/ui/collaborations_screen.dart';
import 'package:portfolio/features/home/presentation/ui/contact_screen.dart';
import 'package:portfolio/features/home/presentation/ui/education_screen.dart';
import 'package:portfolio/features/home/presentation/ui/home_screen.dart';
import 'package:portfolio/features/home/presentation/ui/projects_screen.dart';
import 'package:portfolio/features/home/presentation/ui/services_screen.dart';
import 'package:portfolio/features/home/presentation/ui/skills_screen.dart';
import 'features/home/presentation/ui/about_screen.dart';
import 'features/splash/splash_screen.dart';

enum Routes { splash, portfolio, about, contact, services, projects, education, skills, collaborations }

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
            ),
            GoRoute(
              path: 'contact',
              name: Routes.contact.name,
              pageBuilder: (context, state) => const MaterialPage(fullscreenDialog: true, child: ContactScreen()),
            ),
            GoRoute(
              path: 'services',
              name: Routes.services.name,
              pageBuilder: (context, state) => const MaterialPage(fullscreenDialog: true, child: ServicesScreen()),
            ),
            GoRoute(
              path: 'projects',
              name: Routes.projects.name,
              pageBuilder: (context, state) => const MaterialPage(fullscreenDialog: true, child: ProjectsScreen()),
            ),
            GoRoute(
              path: 'education',
              name: Routes.education.name,
              pageBuilder: (context, state) => const MaterialPage(fullscreenDialog: true, child: EducationScreen()),
            ),
            GoRoute(
              path: 'skills',
              name: Routes.skills.name,
              pageBuilder: (context, state) => const MaterialPage(fullscreenDialog: true, child: SkillsScreen()),
            ),
            GoRoute(
              path: 'collaborations',
              name: Routes.collaborations.name,
              pageBuilder: (context, state) =>
                  const MaterialPage(fullscreenDialog: true, child: CollaborationsScreen()),
            ),
          ],
        )
      ],
    ),
  ],
);
