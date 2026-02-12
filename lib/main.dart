import 'package:flutter/material.dart';
import 'package:focusflow/core/core.dart';
import 'package:focusflow/core/core.dart' as di;
import 'package:focusflow/feature/ddemo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const FocusFlowApp());
}

class FocusFlowApp extends StatelessWidget {
  const FocusFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FocusFlow',
      theme: AppTheme.light,
      home: DemoScreen(),
    );
  }
}
