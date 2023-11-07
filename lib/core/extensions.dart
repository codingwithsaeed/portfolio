import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/features/home/presentation/store/home_ui_store.dart';
import 'package:provider/provider.dart';

extension ContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  bool get isFarsi => read<HomeUiStore>().locale == const Locale('fa');
  ScreenSize get screenSize => Screen.fromContext(this).screenSize;
}

extension FontSize on ScreenSize {
  double get smallFontSize {
    return switch (this) {
      ScreenSize.xsmall => 14,
      ScreenSize.small => 16,
      ScreenSize.medium => 18,
      ScreenSize.large => 20,
      ScreenSize.xlarge => 22,
    };
  }

  double get mediumFontSize {
    return switch (this) {
      ScreenSize.xsmall => 16,
      ScreenSize.small => 18,
      ScreenSize.medium => 20,
      ScreenSize.large => 22,
      ScreenSize.xlarge => 24,
    };
  }

  double get largeFontSize {
    return switch (this) {
      ScreenSize.xsmall => 18,
      ScreenSize.small => 20,
      ScreenSize.medium => 22,
      ScreenSize.large => 24,
      ScreenSize.xlarge => 26,
    };
  }
}
