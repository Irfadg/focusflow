import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class FocusFlowText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;

  const FocusFlowText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
  });

  const FocusFlowText.heading(
    this.text, {
    super.key,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
  }) : style = AppTextStyles.heading;

  const FocusFlowText.title(
    this.text, {
    super.key,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
  }) : style = AppTextStyles.title;

  const FocusFlowText.body(
    this.text, {
    super.key,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
  }) : style = AppTextStyles.body;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: (style ?? AppTextStyles.body).copyWith(color: color),
    );
  }
}