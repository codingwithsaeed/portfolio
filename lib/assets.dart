import 'package:easy_localization/easy_localization.dart';

abstract final class Assets {
  static const me1 = 'assets/images/me1.png';
  static const us = 'assets/images/us.png';
  static const ir = 'assets/images/ir.png';
}

enum Fonts { dosis, roboto, iransans, vazir }

enum TranslationKeys {
  myName,
  title,
  about,
  skills,
  projects,
  contact,
  education,
  collaborations,
  services;

  String get translated => name.tr();
}

typedef TKey = TranslationKeys;
