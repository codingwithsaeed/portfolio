import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtensions on Widget {
  Widget center() => Center(child: this);
  Widget expand() => Expanded(child: this);
}

extension ContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get _theme => Theme.of(this);

  TextTheme get _textTheme => _theme.textTheme;
  TextStyle get bodyLarge => _textTheme.bodyLarge!.copyWith(fontSize: 16.spMin);
  TextStyle get bodyMedium => _textTheme.bodyMedium!.copyWith(fontSize: 14.spMin);
  TextStyle get bodySmall => _textTheme.bodySmall!.copyWith(fontSize: 13.spMin);
  TextStyle get titleLarge => _textTheme.titleLarge!.copyWith(fontSize: 16.spMin);
  TextStyle get titleMedium => _textTheme.titleMedium!.copyWith(fontSize: 14.spMin);
  TextStyle get titleSmall => _textTheme.titleSmall!.copyWith(fontSize: 13.spMin);

  ColorScheme get _scheme => _theme.colorScheme;
  Color get primary => _scheme.primary;
  Color get onPrimary => _scheme.onPrimary;
  Color get secondary => _scheme.secondary;
  Color get tertiary => _scheme.tertiary;
}

extension TextStyleFontSize on TextStyle {
  TextStyle get small => copyWith(fontSize: 12.sp);
  TextStyle get medium => copyWith(fontSize: 14.sp);
  TextStyle get large => copyWith(fontSize: 16.sp);
}
