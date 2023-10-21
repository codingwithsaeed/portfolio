import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  TextDirection get direction => locale == const Locale('fa') ? TextDirection.rtl : TextDirection.ltr;
  bool get isRtl => locale == const Locale('fa');
}
