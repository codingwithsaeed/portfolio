import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/home/presentation/store/home_ui_store.dart';
import 'package:portfolio/features/home/presentation/ui/about_screen.dart';
import 'package:portfolio/features/home/presentation/ui/collaborations_screen.dart';
import 'package:portfolio/features/home/presentation/ui/contact_screen.dart';
import 'package:portfolio/features/home/presentation/ui/education_screen.dart';
import 'package:portfolio/features/home/presentation/ui/projects_screen.dart';
import 'package:portfolio/features/home/presentation/ui/services_screen.dart';
import 'package:portfolio/features/home/presentation/ui/skills_screen.dart';
import 'package:portfolio/router.dart';
import 'package:provider/provider.dart';

enum HomeServiceType {
  about,
  skills,
  education,
  collaborations,
  projects,
  contact,
  services;

  String get translated => name.tr();
  Widget get screen {
    return switch (this) {
      HomeServiceType.about => const AboutScreen(),
      HomeServiceType.skills => const SkillsScreen(),
      HomeServiceType.education => const EducationScreen(),
      HomeServiceType.collaborations => const CollaborationsScreen(),
      HomeServiceType.projects => const ProjectsScreen(),
      HomeServiceType.contact => const ContactScreen(),
      HomeServiceType.services => const ServicesScreen(),
    };
  }
}

base class HomeServiceModel {
  final HomeServiceType type;
  final IconData icon;
  final Function(BuildContext context) onTap;

  const HomeServiceModel({required this.type, required this.icon, required this.onTap});
}

final services = [
  HomeServiceModel(
    type: HomeServiceType.about,
    icon: Icons.person,
    onTap: (context) {
      final store = context.read<HomeUiStore>();
      if (store.isHandset) {
        context.goNamed(Routes.about.name);
        return;
      }
      store.setSelectedService(HomeServiceType.about);
    },
  ),
  HomeServiceModel(
    type: HomeServiceType.skills,
    icon: Icons.code_rounded,
    onTap: (context) {
      final store = context.read<HomeUiStore>();
      if (store.isHandset) {
        context.goNamed(Routes.skills.name);
        return;
      }
      store.setSelectedService(HomeServiceType.skills);
    },
  ),
  HomeServiceModel(
    type: HomeServiceType.education,
    icon: Icons.book,
    onTap: (context) {
      final store = context.read<HomeUiStore>();
      if (store.isHandset) {
        context.goNamed(Routes.education.name);
        return;
      }
      store.setSelectedService(HomeServiceType.education);
    },
  ),
  HomeServiceModel(
    type: HomeServiceType.collaborations,
    icon: Icons.apartment_rounded,
    onTap: (context) {
      final store = context.read<HomeUiStore>();
      if (store.isHandset) {
        context.goNamed(Routes.collaborations.name);
        return;
      }
      store.setSelectedService(HomeServiceType.collaborations);
    },
  ),
  HomeServiceModel(
    type: HomeServiceType.projects,
    icon: Icons.work,
    onTap: (context) {
      final store = context.read<HomeUiStore>();
      if (store.isHandset) {
        context.goNamed(Routes.projects.name);
        return;
      }
      store.setSelectedService(HomeServiceType.projects);
    },
  ),
  HomeServiceModel(
    type: HomeServiceType.contact,
    icon: Icons.phone_android_rounded,
    onTap: (context) {
      final store = context.read<HomeUiStore>();
      if (store.isHandset) {
        context.goNamed(Routes.contact.name);
        return;
      }
      store.setSelectedService(HomeServiceType.contact);
    },
  ),
  HomeServiceModel(
    type: HomeServiceType.services,
    icon: Icons.design_services_rounded,
    onTap: (context) {
      final store = context.read<HomeUiStore>();
      if (store.isHandset) {
        context.goNamed(Routes.services.name);
        return;
      }
      store.setSelectedService(HomeServiceType.services);
    },
  ),
];
