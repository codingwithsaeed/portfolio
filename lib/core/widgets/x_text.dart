import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions.dart';

class XText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  const XText(this.text, {super.key, this.style, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style:
          style?.copyWith(color: color) ?? context.titleMedium.copyWith(overflow: TextOverflow.ellipsis, color: color),
    );
  }
}
