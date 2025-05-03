import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextDirection textDirection;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppTextWidget({
    Key? key,
    required this.text,
    this.style,
    this.textDirection = TextDirection.ltr,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
