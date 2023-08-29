import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget center() => Center(child: this);
  Widget expand() => Expanded(child: this);
}

extension ContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get _theme => Theme.of(this);

  TextTheme get _textTheme => _theme.textTheme;
  TextStyle get bodyLarge => _textTheme.bodyLarge!;
  TextStyle get bodyMedium => _textTheme.bodyMedium!;
  TextStyle get bodySmall => _textTheme.bodySmall!;
  TextStyle get titleLarge => _textTheme.titleLarge!;
  TextStyle get titleMedium => _textTheme.titleMedium!;
  TextStyle get titleSmall => _textTheme.titleSmall!;

  ColorScheme get _scheme => _theme.colorScheme;
  Color get primary => _scheme.primary;
  Color get onPrimary => _scheme.onPrimary;
  Color get secondary => _scheme.secondary;
  Color get tertiary => _scheme.tertiary;
}
