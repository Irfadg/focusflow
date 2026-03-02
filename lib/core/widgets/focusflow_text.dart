import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class FocusFlowText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;

  const FocusFlowText(
    this.text, {
    super.key,
    this.style,
    this.align,
    this.maxLines,
    this.overflow,
  });

  /// Factory constructors for common types

  const FocusFlowText.heading(
    this.text, {
    super.key,
  }) : style = AppTextStyles.heading,
       align = null,
       maxLines = null,
       overflow = null;

  const FocusFlowText.title(
    this.text, {
    super.key,
  }) : style = AppTextStyles.title,
       align = null,
       maxLines = null,
       overflow = null;

  const FocusFlowText.body(
    this.text, {
    super.key,
  }) : style = AppTextStyles.body,
       align = null,
       maxLines = null,
       overflow = null;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? AppTextStyles.body,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}