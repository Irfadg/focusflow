import 'package:flutter/material.dart';
import 'package:focusflow/core/core.dart';


class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Design System Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("FocusFlow", style: AppTextStyles.heading),
            const SizedBox(height: 8),
            const Text(
              "Modern productivity UI system",
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 24),
            AppButton(
              text: "Primary Button",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
