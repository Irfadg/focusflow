import 'package:flutter/material.dart';

class AppSpacing {
  // Sizes
  static const xs = 4.0;
  static const s = 8.0;
  static const sm = 12.0;
  static const m = 16.0;
  static const l = 24.0;
  static const xl = 32.0;
  static const xxl = 64.0;

  // Vertical gaps
  static const vXS = SizedBox(height: xs);
  static const vS = SizedBox(height: s);
  static const vSM = SizedBox(height: sm);
  static const vM = SizedBox(height: m);
  static const vL = SizedBox(height: l);
  static const vXL = SizedBox(height: xl);
  static const vXXL = SizedBox(height: xxl);

  // Horizontal gaps
  static const hXS = SizedBox(width: xs);
  static const hS = SizedBox(width: s);
  static const hSM = SizedBox(width: sm);
  static const hM = SizedBox(width: m);
  static const hL = SizedBox(width: l);
  static const hXL = SizedBox(width: xl);
}