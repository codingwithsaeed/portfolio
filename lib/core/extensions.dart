import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

extension ContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TextDirection get direction => locale == const Locale('fa') ? TextDirection.rtl : TextDirection.ltr;
  bool get isRtl => locale == const Locale('fa');
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
